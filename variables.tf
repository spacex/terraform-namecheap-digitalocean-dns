variable "domains" {
  description = <<-EOT
    List of domains to set up

    Must have the structure as follows:

    domains = {
      "<domain name>" = {
        "<record name> = {
          # See descriptions for type of digitalocean_record resource
          type     = "(Required) Type of the record"
          value    = "(Required) The value of the record"
          port     = "(Optional) Port value for the record"
          priority = "(Optional) Priority of the record"
          weight   = "(Optional) Weight of the record"
          ttl      = "(Optional) TTL of the record"
          flags    = "(Optional) Flags of the record"
          tag      = "(Optional) Tags for the record"
        }
      }
    }

    Example:

    domains = {
      "example.com" = {
        "www" = {
          type  = "CNAME"
          value = "webhost-01.example.com"
          ttl   = 3600
        }
        "webhost-01" = {
          type  = "A"
          value = "192.168.1.1"
          ttl   = 3600
        }
      }
    }
  EOT
}

variable "default_ttl" {
  type        = number
  default     = null
  description = <<-EOT
    Default ttl to use for all records if ttl not specified.
  EOT
}
