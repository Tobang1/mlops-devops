# How to use this module:

1\ If you want to use this module set - `zone_name`


**Configurable variables:**

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| zone_name | This is the name of the hosted zone. | string | :x: | :heavy_check_mark: |
| zone_tags | A map of tags to assign to the zone. | string | :x: | :x: |
| force_destroy | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | bool | :x: | :x: |
| comment | A comment for the hosted zone. | string | :x: | :x: |
| delegation_set_id | The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones. | string | :x: | :x: |
| vpc_id | ID of the VPC to associate. | string | :x: | :x: |
| vpc_region | Region of the VPC to associate. Defaults to AWS provider region. | string | :x: | :x: |

**Working Example**

```
module "route53" {
  source    = "./modules/route53"
  zone_name = "test.darey.io"
}

module "route53" {
  source    = "./modules/route53"
  zone_name = "test.darey.io"

  vpc {
    vpc_id = "vpc-1234567"
  }
}
```
