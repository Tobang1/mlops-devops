data "aws_iam_policy_document" "autoscaler" {
  
  statement {
    sid = "0"
    actions = [ 
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup"
    ]
    resources = ["*"]
    condition {
      test = "StringEquals"
      variable = "aws:ResourceTag/k8s.io/cluster-autoscaler/${var.cluster_name}"
      values = [ "owned" ]
    }
  }
  statement {
    sid = "1"
    actions = [ 
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeAutoScalingGroups",
      "ec2:DescribeLaunchTemplateVersions",
      "autoscaling:DescribeTags",
      "autoscaling:DescribeLaunchConfigurations"
    ]
    resources = [ "*" ]
  }
}

resource "aws_iam_role" "autoscaler" {
  
  name = "clusterautoscaler"

  assume_role_policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Principal": {
                  "Federated": "arn:aws:iam::681105653673:oidc-provider/${module.eks.cluster_oidc_issuer_url}"
              },
              "Action": "sts:AssumeRoleWithWebIdentity",
              "Condition": {
                  "StringEquals": {
                      "${module.eks.cluster_oidc_issuer_url}:aud": "sts.amazonaws.com"
                  }
              }
          }
      ]
  })
}

resource "aws_iam_role_policy" "autoscaler" {
  
  name = "autoscaler"
  role = aws_iam_role.autoscaler.id

  policy = data.aws_iam_policy_document.autoscaler.json
}
