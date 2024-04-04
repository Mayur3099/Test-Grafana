terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
    }
  }
}

provider "grafana" {
  url  = "https://grafana-prod.devx.pinelabs.com/grafana/"
  auth = var.grafana_auth
}

resource "grafana_folder" "Uptime_Loki" {
  title = "Uptime Loki New [Test]"
}

resource "grafana_dashboard" "Test_Dashboard" {
  folder      = grafana_folder.Uptime_Loki.id
  config_json = jsonencode({ "title" : "Testing Terraform" })
}

