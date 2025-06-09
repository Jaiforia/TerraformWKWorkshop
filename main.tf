terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}

#Version 1 of main.tf without local variable
# resource "azurerm_resource_group" "contoso_rg" {
#   name     = "contoso_rg"
#   location = "UK South"

#   tags = {
#     cost_center = "contoso research"
#   }
# }

#Version 2: Using locals block
locals {
  prefix = "contoso"
  region = "North Europe"
  tags = {
    cost_center = "contoso research"
  }
}

resource "azurerm_resource_group" "contoso_rg" {
  name     = "${local.prefix}_rg"
  location = local.region
  tags     = local.tags
}

resource "azurerm_resource_group" "contoso_dev_rg" {
  name     = "${local.prefix}_dev_rg"
  location = local.region
  tags     = local.tags
}