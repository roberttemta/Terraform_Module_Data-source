
module "keypaire1" {
  source = "../keypair"
  key_name = "terraform_key-paire"
  key_pair_filename = "terraform_key.pem"
  region = "us-east-1"
}


