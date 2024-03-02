output "domains" {
  value       = digitalocean_domain.do_domains
  description = <<-EOT
    Domain resources created (digitalocean_domain)
  EOT
}

output "dns_records" {
  value       = digitalocean_record.do_records
  description = <<-EOT
    DNS record resources created (digitalocean_record)
  EOT
}