###########################################################
# IBM Cloud simple database provisioning
# Copyright 2020 IBM
###########################################################

module "sleepy-test" {
  source            = "git::https://github.com/srikar-git/tf_cloudless_sleepy.git?ref=v0.12"
  sample_var        = "some test value"
  sleepy_time       = 5
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}
module "database_simple-etcd" {
  source            = "git::https://github.com/srikar-git/terraform-ibm-database.git//modules/etcd"
  location          = var.location
  plan              = "standard"
  service_name      = var.service_name
  resource_group_id = data.ibm_resource_group.resource_group.id
  tags              = var.tags
  memory_allocation = var.memory_allocation
  disk_allocation   = var.disk_allocation
  cpu_allocation    = var.cpu_allocation
  database_version  = var.database_version
  service_endpoints = var.service_endpoints
}
