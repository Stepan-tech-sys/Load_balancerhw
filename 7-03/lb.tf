resource "yandex_lb_target_group" "web_tg" {
    name = "web-target-group"

    target {
        subnet_id = yandex_vpc_subnet.develop_a.id
        address = yandex_compute_instance.web_a.network_interface[0].ip_address

    }
    target {
        subnet_id = yandex_vpc_subnet.develop_b.id
        address = yandex_compute_instance.web_b.network_interface[0].ip_address
    
    }   
    target {
        subnet_id = yandex_vpc_subnet.develop_b.id
        address = yandex_compute_instance.wrong_b.network_interface[0].ip_address
    
    }
}

resource "yandex_lb_network_load_balancer" "web_lb" {
    name = "web-load-balancer"

    listener{
        name = "web-listener"
        port = 80

        external_address_spec {
            ip_version = "ipv4"
        }
    }
    attached_target_group {
        target_group_id = yandex_lb_target_group.web_tg.id

        healthcheck {
            name = "http-health"
            interval =2
            timeout = 1
            unhealthy_threshold = 2
            healthy_threshold = 2

            http_options {
                port = 80
                path = "/"
            }
        }
    }
}