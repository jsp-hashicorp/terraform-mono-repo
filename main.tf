# Configure the Nomad provider
provider "nomad" {
  address = "http://nomad.service.consul:4646"
}


# Register a job
resource "nomad_job" "nginx" {
###
  jobspec = <<EOT
  variable "http_port" {
      type=string
  }
  variable "service_name"{
      type=string
  }
  variable "stage_tag"{
      type = string
  }
  job "nginx-dev" {
  datacenters = ["dc1"]
  type = "service"
  group "nginx-dev" {
    count = 1
    task "nginx-dev" {
      driver = "docker"
      config {
        image = "nginxdemos/nginx-hello"
        ports = ["http"]
      }
      resources {
        cpu    = 100 # 100 MHz
        memory = 128 # 128 MB
      }
      service {
        name = var.service_name
        tags = [ var.stage_tag, "urlprefix-/nginx" ]
        port = "http"
        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
   network {
       port "http" {
            static = var.http_port
        }
      }
  }
}
  EOT
  
  hcl2 {
    enabled = true
    vars = {
       "http_port" = var.http_port,
       "service_name" = var.service_name,
       "stage_tag" = var.service_tag,
   }
  }

}

data  "nomad_job" "result" {
    job_id = "nginx-dev"
    depends_on = [nomad_job.nginx]
}
