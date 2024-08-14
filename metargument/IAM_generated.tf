
/*
resource "aws_iam_user" "user1" {
  force_destroy        = null
  name                 = "ROBERT-TEMTA1"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
  tags_all             = {}
}
*/
#Do not destroy this user, chech you note on OneNote to see why.
# It was remove from the state file with this command terraform state rm <resource you wish to remove>