variable "location" {
  type        = string
  description = "location of your resource group"
  default = "uksouth"
}

variable "subscriptionID" {
  type        = string
  description = "Variable for our resource group"
}

variable "resourceGroupName" {
  type        = string
  description = "name of resource group"
  default = "AB_DEMO_NETWORK"
}
