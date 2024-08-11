provider "aws" {
  region = "us-east-1"
}

module "Ligtsail_server" {
  source = "../lightsail"
  instance_name = "QA_Server"
  blueprint_id = "Amazon_linux_2"
  //bundle_id = "small_1_0"
  bundle_id = "micro_1_0"
  key_pair_name = "lightsailvirginiakey"
  env = "QA"
  team = "QA"
  availability_zone = "us-east-1a"
  Created_by = "Eden TEMTA"

}