# 000base

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_account\_id | The account ID you are building into. | string | n/a | yes |
| region | The AWS region the state should reside in. | string | n/a | yes |
| environment | The name of the environment, e.g. Production, Development, etc. | string | n/a | yes |
| layer | The name of the layer. | string | n/a | yes |
| vpc\_name | The name of the VPC. | string | n/a | yes |
| cidr\_range | CIDR range for the VPC | string | n/a | yes |
| private\_subnets | An array of CIDR ranges to use for private subnets | list | n/a | yes |
| public\_subnets | An array of CIDR ranges to use for public subnets | list | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_eip | The NAT gateway EIP(s) of the Base Network. |
| private\_route\_tables | The private route tables of the Base Network. |
| private\_subnets | The private subnets of the Base Network. |
| public\_route\_tables | The public route tables of the Base Network. |
| public\_subnets | The public subnets of the Base Network. |
| vpc\_id | The VPC ID of the Base Network. |
