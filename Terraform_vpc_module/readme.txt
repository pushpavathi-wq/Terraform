/* CIDR is a mandatory variable
/* Project name and environment are common variables
/* project name,CIDR,environment are mandatory variables,please write your own variables according to requirement.
/* The subnet cidr range,vpc cidr ranges provided by the network team..
/* Count cant be kept in locals as we keep it only in data.tf and main.tf
 Error: Reference to "count" in non-counted context
│
│   on ..\Terraform_vpc_module\locals.tf line 4, in locals:
│    4:   public_name = "${var.project_name}-public-${local.az_names[count.index]}"
│
│ The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument is
│ set.