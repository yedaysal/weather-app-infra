resource "google_compute_instance" "devops-server" {
  name         = "devops-server"
  machine_type = var.machine_type
  zone         = var.zone
  hostname     = var.hostname

  metadata_startup_script = "sudo useradd -m -s /usr/bin/bash ansible ; sudo echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible ; sudo mkdir /home/ansible/.ssh ; sudo echo '${var.ssh_pub_key}' > /home/ansible/.ssh/authorized_keys"

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Include this section to give the VM an public IP address
    }
  }

  // Tag this instance with 'jenkins-server' and 'nexus-server'
  // tags so that the firewall rules 'default-allow-jenkins-port'
  // and 'default-allow-nexus-port' target this instance to allow
  // external IPs to access the Jenkins and Nexus servers on this
  // instance
  tags = [ "jenkins-server", "nexus-server" ]
}

resource "google_compute_firewall" "jenkins-server" {
  name = "default-allow-jenkins-port"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [ "8080" ]
  }

  // Allow traffic from everywhere to instances with jenkins-server tag
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = [ "jenkins-server" ]
}

resource "google_compute_firewall" "nexus-server" {
  name = "default-allow-nexus-port"
  network = "default"

  allow {
    protocol = "tcp"
    ports = [ "8081" ]
  }

  // Allow traffic from everywhere to instances with nexus-server tag
  source_ranges = [ "0.0.0.0/0" ]
  target_tags = [ "nexus-server" ]
}
