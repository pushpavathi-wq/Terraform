
# Create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.dns_hostname  # used when we want to allow requess from dns/ip's

# project name, env are common tags here
  tags = merge(
   var.common_tags,
   var.vpc_tags,
   
  
    {
      Name = local.resource_name
    }
  
  ) 
  }

# Internet Gateway
  resource "aws_internet_gateway" "maingateway" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.internet_gateway_tags,
  {
    Name = local.resource_name
  }
  )
}


# Create public subnets(2)

resource "aws_subnet" "public-subnet" {
  count = length(var.cidr_publicsubnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_publicsubnet[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
  {
    Name = "${var.project_name}-public-${local.az_names[count.index]}"
  }
  )
}


# Create private subnets(2)

resource "aws_subnet" "private_subnet" {
  count = length(var.cidr_privatesubnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_privatesubnet[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
  {
    Name = "${var.project_name}-private-${local.az_names[count.index]}"
  }
  )
}




# Create Database subnets (2)


resource "aws_subnet" "database_subnet" {
  count = length(var.cidr_databasesubnet)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_databasesubnet[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.common_tags,
    var.vpc_tags,
  {
    Name = "${var.project_name}-database-${local.az_names[count.index]}"
  }
  )
}


# Create elastic ip

resource "aws_eip" "example-eip" {  # no need of VPC id here as it is same module
  domain   = "vpc"

  tags = {
    Name = var.project_name
  }
}


# Create NAT Gateway

resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.example-eip.id
  subnet_id     = aws_subnet.public-subnet[0].id

  tags = merge(
    var.common_tags,
    {
    Name = "${var.project_name}-NAT"
    }
  )
  

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.maingateway]
}


# Create route table for public subnets

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
  
  {
    Name = "${var.project_name}-public"  # interpolation (concat)
  }

  )
}


# Create route table for public subnet 

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
  
  {
    Name = "${var.project_name}-private"  # interpolation (concat)
  }

  )
}



# Create route table for database sunets

resource "aws_route_table" "database_route" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
  
  {
    Name = "${var.project_name}-database"  # interpolation (concat)
  }

  )
}


# Create route and attach IG to make it public route

resource "aws_route" "route_public" {
  route_table_id            = aws_route_table.public_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.maingateway.id
}


# Create route for private tables and attach  NAT gateway

resource "aws_route" "route_private" {
  route_table_id            = aws_route_table.private_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.NAT.id
}


# Create route for database tables and attach NAT gateway

resource "aws_route" "route_database" {
  route_table_id            = aws_route_table.database_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.NAT.id
}



# Associate public subnets with public route table /keep public subnets in public route table

resource "aws_route_table_association" "association_public" {
  count = length(var.cidr_publicsubnet)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public_route.id
}


#  Associate private subnets with public route table /keep public subnets in public route table

resource "aws_route_table_association" "association_private" {
  count = length(var.cidr_privatesubnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route.id
}

#  Associate database subnets with public route table /keep public subnets in public route table

resource "aws_route_table_association" "association_database" {
  count = length(var.cidr_databasesubnet)
  subnet_id      = aws_subnet.database_subnet[count.index].id
  route_table_id = aws_route_table.database_route.id
}

