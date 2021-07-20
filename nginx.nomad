job "nginx" {
  datacenters = ["dc1"]
  type = "service"
  group "nginx" {
    count = 1
    task "nginx" {
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
        name = "nginx"
        tags = [ "nginx", "web", "urlprefix-/nginx" ]
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
            static = 8080
        }
      }
  }
}