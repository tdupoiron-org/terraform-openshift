resource "ovh_domain_zone_record" "openshift_domain_record" {
  zone      = var.ovh_domain
  subdomain = var.openshift_subdomain
  fieldtype = "A"
  target    = aws_instance.openshift_ec2.public_ip
}