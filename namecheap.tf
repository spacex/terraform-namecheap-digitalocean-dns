resource "namecheap_domain_records" "namecheap_domains" {
  for_each = digitalocean_domain.do_domains

  domain = each.value.id
  mode   = "OVERWRITE"

  nameservers = [
    "ns1.digitalocean.com",
    "ns2.digitalocean.com",
    "ns3.digitalocean.com"
  ]
}