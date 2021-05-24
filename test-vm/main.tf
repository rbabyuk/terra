provider "google" {
  region      = var.region
  project     = var.project
//  credentials = file(var.gcp_auth_file)
}


resource "random_id" "instance_id" {
  byte_length = 4
}


// reserve External Static IP Address
resource "google_compute_address" "jenkins-server-ip" {
  name         = "jenkins-server-ip-1"
  network_tier = "STANDARD"
}


resource "google_compute_instance" "default" {
  name                      = "${var.vm_name_prefix}-${random_id.instance_id.hex}"
  project                   = var.project
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = true


  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
      nat_ip       = google_compute_address.jenkins-server-ip.address
      network_tier = "STANDARD"
    }
  }

  tags = ["non-prod", "ci", "jenkins", "generic"]
  metadata = {
    block-project-ssh-keys = false
  }
}
