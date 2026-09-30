output "load_balancer_ip" {
    value = yandex_lb_network_load_balancer.web_lb.id
}