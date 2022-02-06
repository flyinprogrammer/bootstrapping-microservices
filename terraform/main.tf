terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "random_pet" "project_name" {
  separator = ""
}

resource "random_pet" "admin_username" {}

locals {
  dynamic_app_name = "flixtube${random_pet.project_name.id}"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}
