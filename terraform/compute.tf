module "gce-container" {
  source           = "terraform-google-modules/container-vm/google"
  version          = "~> 3.1"
  cos_image_family = "stable"
  restart_policy   = "Always"

  container = {
    image = "docker.io/thijsvanloef/palworld-server-docker"
    env = [
      {
        name  = "PLAYERS"
        value = "16"
      },
      {
        name  = "PORT"
        value = "8211"
      },
      {
        name  = "MULTITHREADING"
        value = "false"
      },
    ]
    volumeMounts = [
      {
        mountPath = "/palworld"
        name      = "palworld-volume"
        readOnly  = false
      },
    ]
  }

  volumes = [
    {
      name = "palworld-volume"

      gcePersistentDisk = {
        pdName = "palworld-volume"
        fsType = "ext4"
      }
    },
  ]
}

resource "google_compute_instance" "pw_server" {
  name         = "pw-server"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.network_tags

  boot_disk {
    initialize_params {
      image = module.gce-container.source_image
    }
  }
  
  attached_disk {
    source      = google_compute_disk.pd.self_link
    device_name = "palworld-volume"
    mode        = "READ_WRITE"
  }

  network_interface {
    network = "default"
    access_config {} // Ephemeral public ip
  }

  // Logging
  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_disk" "pd" {
  project = var.project
  name    = "pw-disk"
  type    = "pd-ssd"
  zone    = var.zone
  size    = 100
}

resource "google_compute_firewall" "pw_rule_b" {
  name    = "pw-firewall"
  network = "default"
  allow {
    protocol = "udp"
    ports    = ["8211"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.network_tags
}
