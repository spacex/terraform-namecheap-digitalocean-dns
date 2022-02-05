resource "digitalocean_domain" "do_domains" {
  for_each = var.domains

  name = each.key
  # ip_address = lookup(lookup(each.value, "@", {}), "value", null)
}

locals {
  domain_records = flatten([
    for domain, domain_records in var.domains : [
      for domain_record_k, domain_record_v in domain_records : {
        domain = domain
        name   = domain_record_k
        type   = domain_record_v.type

        value = join("", [
          domain_record_v.value,
          domain_record_v.type == "CNAME" ? "." : ""
        ])

        port     = lookup(domain_record_v, "port", null)
        priority = lookup(domain_record_v, "priority", null)
        weight   = lookup(domain_record_v, "weight", null)
        ttl      = lookup(domain_record_v, "ttl", var.default_ttl)
        flags    = lookup(domain_record_v, "flags", null)
        tag      = lookup(domain_record_v, "tag", null)
      }
    ]
  ])
}

resource "digitalocean_record" "do_records" {
  for_each = { for domain_record in local.domain_records :
    join("/", [
      domain_record.domain,
      domain_record.type,
      domain_record.name
    ]) => domain_record
  }

  domain   = digitalocean_domain.do_domains[each.value.domain].id
  type     = each.value.type
  name     = each.value.name
  value    = each.value.value
  port     = each.value.port
  priority = each.value.priority
  weight   = each.value.weight
  ttl      = each.value.ttl
  flags    = each.value.flags
  tag      = each.value.tag
}