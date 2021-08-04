#__________________________________________________________
#
# Global Variables
#__________________________________________________________

variable "organizations" {
  default     = ["default"]
  description = "Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = set(string)
}

variable "tags" {
  default     = []
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = list(map(string))
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

variable "ip_pools" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      description    = ""
      dns_servers_v4 = ["208.67.220.220", "208.67.222.222"]
      from           = 20
      gateway        = "198.18.0.1/24"
      organization   = "default"
      size           = 30
      tags           = []
    }
  }
  description = <<-EOT
  Intersight IP Pool Variable Map.
  1. description - A description for the policy.
  2. dns_servers_v4 - DNS Servers for the IP Pool.
  3. from - host address of the pool starting address.
  4. gateway - ip/prefix of the gateway.
  5. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  6. size - Number of host addresses to assign to the pool.
  7. tags - List of key/value Attributes to Assign to the Policy.
  EOT
  type = map(object(
    {
      description    = optional(string)
      dns_servers_v4 = optional(set(string))
      from           = optional(number)
      gateway        = optional(string)
      organization   = optional(string)
      size           = optional(number)
      tags           = optional(list(map(string)))
    }
  ))
}


#__________________________________________________________
#
# Kubernetes Policy Variables
#__________________________________________________________

#______________________________________________
#
# Kubernetes Add-ons Policy Variables
#______________________________________________

variable "k8s_addon_policies" {
  default = {
    default = { # The Addon Policy Name will be {each.key}.  In this case it would be default if left like this.
      description       = ""
      install_strategy  = "Always"
      organization      = "default"
      release_name      = ""
      release_namespace = ""
      tags              = []
      upgrade_strategy  = "UpgradeOnly"
    }
  }
  description = <<-EOT
  Intersight Kubernetes Service Add-ons Variable Map.  Add-ons Options are {ccp-monitor|kubernetes-dashboard} currently.
  1. description - A description for the policy.
  2. install_strategy - Addon install strategy to determine whether an addon is installed if not present.
   * None - Unspecified install strategy.
   * NoAction - No install action performed.
   * InstallOnly - Only install in green field. No action in case of failure or removal.
   * Always - Attempt install if chart is not already installed.
  3. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  4. release_name - Name for the helm release.
  5. release_namespace - Namespace for the helm release.
  6. tags - List of key/value Attributes to Assign to the Policy.
  7. upgrade_strategy - Addon upgrade strategy to determine whether an addon configuration is overwritten on upgrade.
   * None - Unspecified upgrade strategy.
   * NoAction - This choice enables No upgrades to be performed.
   * UpgradeOnly - Attempt upgrade if chart or overrides options change, no action on upgrade failure.
   * ReinstallOnFailure - Attempt upgrade first. Remove and install on upgrade failure.
   * AlwaysReinstall - Always remove older release and reinstall.
  EOT
  type = map(object(
    {
      description       = optional(string)
      install_strategy  = optional(string)
      organization      = optional(string)
      release_name      = optional(string)
      release_namespace = optional(string)
      tags              = optional(list(map(string)))
      upgrade_strategy  = optional(string)
    }
  ))
}


#______________________________________________
#
# Kubernetes Network CIDR Policy Variables
#______________________________________________

variable "k8s_network_cidr" {
  default = {
    default = { # The Network CIDR Policy Name will be {each.key}.  In this case it would be default if left like this.
      cidr_pod     = "100.64.0.0/16"
      cidr_service = "100.65.0.0/16"
      cni_type     = "Calico"
      description  = ""
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  Intersight Kubernetes Network CIDR Policy Variable Map.
  1. cidr_pod - CIDR block to allocate pod network IP addresses from.
  2. cidr_service - Pod CIDR Block to be used to assign Pod IP Addresses.
  3. cni_type - Supported CNI type. Currently we only support Calico.
   * Calico - Calico CNI plugin as described in https://github.com/projectcalico/cni-plugin
   * Aci - Cisco ACI Container Network Interface plugin.
  4. description - A description for the policy.
  5. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  6. tags - tags - List of key/value Attributes to Assign to the Policy.
  EOT
  type = map(object(
    {
      cidr_pod     = optional(string)
      cidr_service = optional(string)
      cni_type     = optional(string)
      description  = optional(string)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#______________________________________________
#
# Kubernetes Node OS Configuration Policy Variables
#______________________________________________

variable "k8s_nodeos_config" {
  default = {
    default = { # The Node OS Config Policy Name will be {each.key}.  In this case it would be default if left like this.
      description    = ""
      dns_servers_v4 = ["208.67.220.220", "208.67.222.222"]
      domain_name    = "example.com"
      ntp_servers    = []
      organization   = "default"
      tags           = []
      timezone       = "Etc/GMT"
    }
  }
  description = <<-EOT
  Intersight Kubernetes Node OS Configuration Policy Variable Map.
  1. description - A description for the policy.
  2. dns_servers_v4 - DNS Servers for the Kubernetes Node OS Configuration Policy.
  3. domain_name - Domain Name for the Kubernetes Node OS Configuration Policy.
  4. ntp_servers - NTP Servers for the Kubernetes Node OS Configuration Policy.
  5. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  6. tags - tags - List of key/value Attributes to Assign to the Policy.
  7. timezone - The timezone of the node's system clock.  For a List of supported timezones see the following URL. https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md.
  EOT
  type = map(object(
    {
      description    = optional(string)
      dns_servers_v4 = optional(list(string))
      domain_name    = optional(string)
      ntp_servers    = optional(list(string))
      organization   = optional(string)
      tags           = optional(list(map(string)))
      timezone       = optional(string)
    }
  ))
}


#______________________________________________
#
# Kubernetes Runtime Policy Variables
#______________________________________________

variable "k8s_runtime_create" {
  default     = false
  description = "Flag to specify if the Kubernetes Runtime Policy should be created or not."
  type        = bool
}

variable "k8s_runtime_policies" {
  default = {
    default = { # The Addon Policy Name will be {each.key}.  In this case it would be default if left like this.
      description        = ""
      docker_bridge_cidr = ""
      docker_no_proxy    = []
      http_hostname      = ""
      http_port          = 8080
      http_protocol      = "http"
      http_username      = ""
      https_hostname     = ""
      https_port         = 8443
      https_protocol     = "https"
      https_username     = ""
      organization       = "default"
      tags               = []
    }
  }
  description = <<-EOT
  Intersight Kubernetes Runtime Policy Variable Map.
   1. description - A description for the policy.
   2. docker_bridge_cidr - The CIDR for docker bridge network. This address space must not collide with other CIDRs on your networks, including the cluster's service CIDR, pod CIDR and IP Pools.
   3. docker_no_proxy - Docker no proxy list, when using internet proxy.
   4. http_hostname - Hostname of the HTTP Proxy Server.
   5. http_port - HTTP Proxy Port.  Range is 1-65535.
   6. http_protocol - HTTP Proxy Protocol. Options are {http|https}.
   7. http_username - Username for the HTTP Proxy Server.
   8. https_hostname - Hostname of the HTTPS Proxy Server.
   9. https_port - HTTPS Proxy Port.  Range is 1-65535
  10. https_protocol - HTTPS Proxy Protocol. Options are {http|https}.
  11. https_username - Username for the HTTPS Proxy Server.
  12. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  13. tags - List of key/value Attributes to Assign to the Policy.
  EOT
  type = map(object(
    {
      description        = optional(string)
      docker_bridge_cidr = optional(string)
      docker_no_proxy    = optional(list(string))
      http_hostname      = optional(string)
      http_port          = optional(number)
      http_protocol      = optional(string)
      http_username      = optional(string)
      https_hostname     = optional(string)
      https_port         = optional(number)
      https_protocol     = optional(string)
      https_username     = optional(string)
      organization       = optional(string)
      tags               = optional(list(map(string)))
    }
  ))
}

variable "k8s_runtime_http_password" {
  default     = ""
  description = "Password for the HTTP Proxy Server, If required."
  sensitive   = true
  type        = string
}

variable "k8s_runtime_https_password" {
  default     = ""
  description = "Password for the HTTPS Proxy Server, If required."
  sensitive   = true
  type        = string
}


#______________________________________________
#
# Kubernetes Trusted Registries Variables
#______________________________________________

variable "k8s_trusted_create" {
  default     = false
  description = "Flag to specify if the Kubernetes Runtime Policy should be created or not."
  type        = bool
}

variable "k8s_trusted_registries" {
  default = {
    default = { # The Trusted Registry Policy Name will be {each.key}.  In this case it would be default if left like this.
      description  = ""
      organization = "default"
      root_ca      = []
      tags         = []
      unsigned     = []
    }
  }
  description = <<-EOT
  Intersight Kubernetes Trusted Registry Policy Variable Map.
  1. description - A description for the policy.
  2. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  3. root_ca - List of root CA Signed Registries.
  4. tags - List of key/value Attributes to Assign to the Policy.
  5. unsigned - List of unsigned registries to be supported.
  EOT
  type = map(object(
    {
      description  = optional(string)
      organization = optional(string)
      root_ca      = optional(list(string))
      tags         = optional(list(map(string)))
      unsigned     = optional(list(string))
    }
  ))
}

#______________________________________________
#
# Kubernetes Version Variables
#______________________________________________

variable "k8s_version_policies" {
  default = {
    default = { # The K8S Version Policy Name will be {each.key}_v{each.version}.  In this case it would be default_v1.19.5 if left like this.
      description  = ""
      organization = "default"
      tags         = []
      version      = "1.19.5"
    }
  }
  description = <<-EOT
  Intersight Kubernetes Version Policy Variable Map.
  1. description - A description for the policy.
  2. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  3. tags - List of key/value Attributes to Assign to the Policy.
  4. version - Desired Kubernetes version.  Options are {1.19.5}
  EOT
  type = map(object(
    {
      description  = optional(string)
      organization = optional(string)
      tags         = optional(list(map(string)))
      version      = optional(string)
    }
  ))
}


#______________________________________________
#
# Kubernetes Virtual Machine Infra Variables
#______________________________________________

variable "k8s_vm_infra_config" {
  default = {
    default = { # The VM Infra Config Policy Name will be {each.key}.  In this case it would be default if left like this.
      description           = ""
      organization          = "HX"
      tags                  = []
      vsphere_cluster       = "HX"
      vsphere_datastore     = "Terraform"
      vsphere_portgroup     = ["Terraform-50"]
      vsphere_resource_pool = "HX"
      vsphere_target        = "11.11.11.80"
    }
  }
  description = <<-EOT
  Intersight Kubernetes Virtual Machine Infra Config Policy Variable Map.
  1. description - A description for the policy.
  2. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  3. tags - List of key/value Attributes to Assign to the Policy.
  4. vsphere_cluster - vSphere Cluster to assign the K8S Cluster Deployment.
  5. vsphere_datastore - vSphere Datastore to assign the K8S Cluster Deployment.r\n
  6. vsphere_portgroup - vSphere Port Group to assign the K8S Cluster Deployment.r\n
  7. vsphere_resource_pool - vSphere Resource Pool to assign the K8S Cluster Deployment.r\n
  8. vsphere_target - Name of the vSphere Target discovered in Intersight, to provision the cluster on.
  EOT
  type = map(object(
    {
      description           = optional(string)
      organization          = optional(string)
      tags                  = optional(list(map(string)))
      vsphere_cluster       = string
      vsphere_datastore     = string
      vsphere_portgroup     = list(string)
      vsphere_resource_pool = optional(string)
      vsphere_target        = string
    }
  ))
}

variable "k8s_vm_infra_password" {
  description = "vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target."
  sensitive   = true
  type        = string
}


#______________________________________________
#
# Kubernetes Virtual Machine Instance Variables
#______________________________________________

variable "k8s_vm_instance_type" {
  default = {
    default = { # The VM Instance Type Policy Name will be {each.key}.  In this case it would be default if left like this.
      cpu          = 4
      description  = ""
      disk         = 40
      memory       = 16384
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  Intersight Kubernetes Node OS Configuration Policy Variable Map.  Name of the policy will be {organization}_{each.key}.
  1. cpu - Number of CPUs allocated to virtual machine.  Range is 1-40.
  2. description - A description for the policy.
  3. disk - Ephemeral disk capacity to be provided with units example - 10 for 10 Gigabytes.
  4. memory - Virtual machine memory defined in mebibytes (MiB).  Range is 1-4177920.
  5. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/
  6. tags - List of key/value Attributes to Assign to the Policy.
  EOT
  type = map(object(
    {
      cpu          = optional(number)
      description  = optional(string)
      disk         = optional(number)
      memory       = optional(number)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#__________________________________________________________
#
# Terraform Cloud Kuberntes Policies Workspace
#__________________________________________________________

module "k8s_policies_workspace" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  auto_apply          = true
  description         = "Intersight Kubernetes Policy Workspace."
  global_remote_state = true
  name                = "Kubernetes_Policies"
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/k8s_policies"
}

output "k8s_policies_workspace" {
  description = "Terraform Cloud Kubernetes Policies Workspace ID."
  value       = module.k8s_policies_workspace.workspace.id
}

#__________________________________________________________
#
# Terraform Cloud Workspace Variables: iks
#__________________________________________________________

module "k8s_policies_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.k8s_policies_workspace
  ]
  category     = "terraform"
  workspace_id = module.k8s_policies_workspace.workspace.id
  variable_list = {
    #---------------------------
    # Intersight Variables
    #---------------------------
    apikey = {
      description = "Intersight API Key."
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    endpoint = {
      description = "Intersight Endpoint."
      key         = "endpoint"
      value       = var.endpoint
    },
    organizations = {
      description = "Intersight Organizations."
      key         = "organizations"
      value       = "${jsonencode(var.organizations)}"
    },
    secretkey = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    #---------------------------
    # K8S Policy Variables
    #---------------------------
    tags = {
      description = "Intersight Tags for Poliices and Profiles."
      hcl         = false
      key         = "tags"
      value       = "${jsonencode(var.tags)}"
    },
    ip_pools = {
      description = "IP Pools."
      hcl         = false
      key         = "ip_pools"
      value       = "${jsonencode(var.ip_pools)}"
    },
    k8s_addon_policies = {
      description = "Addons Policies."
      hcl         = false
      key         = "k8s_addon_policies"
      value       = "${jsonencode(var.k8s_addon_policies)}"
    },
    k8s_network_cidr = {
      description = "Kubernetes Network CIDR Policy Variables."
      hcl         = false
      key         = "k8s_network_cidr"
      value       = "${jsonencode(var.k8s_network_cidr)}"
    },
    k8s_nodeos_config = {
      description = "Kubernetes Node OS Configuration Policy Variables."
      hcl         = false
      key         = "k8s_nodeos_config"
      value       = "${jsonencode(var.k8s_nodeos_config)}"
    },
    k8s_runtime_create = {
      description = "Kubernetes Runtime Policy Create Option."
      key         = "k8s_runtime_create"
      value       = var.k8s_runtime_create
    },
    k8s_runtime_policies = {
      description = "Kubernetes Runtime Policy Variables."
      hcl         = false
      key         = "k8s_runtime_policies"
      value       = "${jsonencode(var.k8s_runtime_policies)}"
    },
    k8s_trusted_create = {
      description = "Kubernetes Trusted Registry Policy Create Option."
      key         = "k8s_trusted_create"
      value       = var.k8s_trusted_create
    },
    k8s_trusted_registries = {
      description = "Kubernetes Trusted Registry Policy Variables."
      hcl         = false
      key         = "k8s_trusted_registries"
      value       = "${jsonencode(var.k8s_trusted_registries)}"
    },
    k8s_version_policies = {
      description = "Kubernetes Version Policy Variables."
      hcl         = false
      key         = "k8s_version_policies"
      value       = "${jsonencode(var.k8s_version_policies)}"
    },
    k8s_vm_infra_config = {
      description = "Kubernetes VIrtual Machine Infra Config Policy Variables."
      hcl         = false
      key         = "k8s_vm_infra_config"
      value       = "${jsonencode(var.k8s_vm_infra_config)}"
    },
    k8s_vm_infra_password = {
      description = "VIrtual Center Password."
      key         = "k8s_vm_infra_password"
      sensitive   = true
      value       = var.k8s_vm_infra_password
    }
    k8s_vm_instance_type = {
      description = "Kubernetes Virtual Machine Instance Policy Variables."
      hcl         = false
      key         = "k8s_vm_instance_type"
      value       = "${jsonencode(var.k8s_vm_instance_type)}"
    }
  }
}
