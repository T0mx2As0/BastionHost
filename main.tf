module "Bastion" {
  source = "./modules/bastion"

  instance_type = var.instance_type
  user          = var.user
  key_name      = var.key_name
}