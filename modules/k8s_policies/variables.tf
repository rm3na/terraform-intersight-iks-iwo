terraform {
  experiments = [module_variable_optional_attrs]
}

#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Global Variables
#__________________________________________________________

variable "organizations" {
  description = "Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "tags" {
  # default     = []
  description = "Please Refer to the tags variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

#______________________________________________
#
# IP Pool Variables
#______________________________________________

variable "ip_pools" {
  description = "Please Refer to the ip_pools variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
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
  description = "Please Refer to the k8s_addon_policies variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

#______________________________________________
#
# Kubernetes Network CIDR Variables
#______________________________________________

variable "k8s_network_cidr" {
  description = "Please Refer to the k8s_network_cidr variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# Kubernetes Node OS Config Variables
#______________________________________________

variable "k8s_nodeos_config" {
  description = "Please Refer to the k8s_nodeos_config variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# Kubernetes Runtime Policy Variables
#______________________________________________

variable "k8s_runtime_policies" {
  description = "Please Refer to the k8s_runtime_policies variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

variable "k8s_runtime_create" {
  default     = false
  description = "Please Refer to the k8s_runtime_create variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = bool
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
  description = "Please Refer to the k8s_trusted_registries variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

#______________________________________________
#
# Kubernetes Verison Variables
#______________________________________________

variable "k8s_version_policies" {
  description = "Please Refer to the k8s_version_policies variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

#______________________________________________
#
# Kubernetes Virtual Machine Infra Config Variables
#______________________________________________

variable "k8s_vm_infra_config" {
  description = "Please Refer to the k8s_vm_infra_config variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
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
  description = "Please Refer to the k8s_vm_instance_type variable information in the tfe module.  In the k8s_policies module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}
