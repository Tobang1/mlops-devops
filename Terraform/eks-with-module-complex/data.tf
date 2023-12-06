data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "IAMSelfManageServiceSpecificCredentials" {
  arn = "arn:aws:iam::aws:policy/IAMSelfManageServiceSpecificCredentials"
}

# data "aws_iam_role" "vault_kms" {
#   name = "vaultKMS"

#   depends_on = [

#   ]
# }