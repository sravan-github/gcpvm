resource "google_compute_instance" "default" {
  name         = "login-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-1804-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

//metadata = {
//   ssh-keys = "user1:${file("/home/sravangcp/sshkey")}"
// }
    metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo Hello world from $(hostname)$(hostname -I) > /var/www/html/index.html"
    tags = ["http-server"]
}

resource "google_compute_firewall" "http-server" {
  name    = "allow-http-terraform"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
