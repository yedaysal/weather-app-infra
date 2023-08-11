# Add an SSH pub key to ec2 to connect to the VMs
resource "aws_key_pair" "weather_app" {
  key_name = "weather-app"
  public_key = var.ssh_pub_key
}

# Create a nic for the weather-app VM
resource "aws_network_interface" "weather_app" {
  subnet_id = data.aws_subnet.weather_app.id
  private_ips = ["172.16.10.100"]
  security_groups = [ "${data.aws_security_group.weather_app.id}" ]

  tags = {
    Name = "weather-app-primary-nic"
  }
}

# Create a VM for weather-app
resource "aws_instance" "weather_app" {
  ami = var.aws_ami_ubuntu_id
  instance_type = var.instance_type

  user_data = <<-EOL
    #!/bin/sh
    
    sudo useradd -m -s /usr/bin/bash ansible
    sudo echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible
    sudo mkdir /home/ansible/.ssh
    sudo echo '${var.ssh_pub_key}' > /home/ansible/.ssh/authorized_keys
  EOL

  network_interface {
    network_interface_id = aws_network_interface.weather_app.id
    device_index = 0
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 30
  }

  key_name = aws_key_pair.weather_app.key_name

  tags = {
    Name = "weather-app"
  }
}

# Create a public static IP for the ansible_controller VM
resource "aws_eip" "weather_app" {
  instance = aws_instance.weather_app.id
  domain = "vpc"

  tags = {
    Name = "weather-app-public-ip"
  }
}
