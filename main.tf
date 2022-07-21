#data "oci_core_vcn" "vcn" {
#  vcn_id = var.vcn-id
#}

resource "oci_core_network_security_group_security_rule" "nsg-ssh-from-pip" {
  network_security_group_id = var.nsg-id
  direction                 = "INGRESS"
  description               = "Allow ssh connectivity from my public IP"
  protocol                  = "6" # TCP: http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  source                    = "${local.ifconfig_co_json.ip}/32"
  stateless                 = false

  tcp_options {
    destination_port_range {
      min = 22
      max = 22
    }

    ## leave unset to allow 'All' port ranges
    # source_port_range {
    #   min = 100
    #   max = 100
    # }
  }
}

