terraform {
  # Версия terraform  
  # required_version = "0.11.11"
}

provider "google" {
  # Версияпровайдера  
  version = "2.0.0"

  # ID проекта  
  project = "${var.project}"

  region = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app"]

  # определениезагрузочногодиска  
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  metadata {
    # путьдопубличногоключа    
    ssh-keys = "a_a_alinichenko_otus:${file(var.public_key_path)}"
  }

  # определениесетевогоинтерфейса  
  network_interface {
    # сеть, ккоторойприсоединитьданныйинтерфейс    
    network = "default"

    # использовать ephemeral IP длядоступаизИнтернет    
    access_config {}
  }

  connection {
    type  = "ssh"
    user  = "a_a_alinichenko_otus"
    agent = false

    # путьдоприватногоключа  
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Названиесети, вкоторойдействуетправило  
  network = "default"

  # Какойдоступразрешить  
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Какимадресамразрешаемдоступ  
  source_ranges = ["0.0.0.0/0"]

  # Правилоприменимодляинстансовсперечисленнымитэгами  
  target_tags = ["reddit-app"]
}
