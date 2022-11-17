#---networking/main.tf---

# Declare the data source
data "aws_availability_zones" "available" {
  exclude_names = ["us-east-1e"]
}

resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "random_shuffle" "az_list" {
  input        = data.aws_availability_zones.available.names
  result_count = var.max_subnets
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "week22-data-plane-vpc-${random_integer.random.id}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "week22_internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "week22-igw"
  }
}

resource "aws_subnet" "week22_public_subnet" {
  count                   = var.public_sn_count
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = random_shuffle.az_list.result[count.index]

  tags = {
    "kubernetes.io/cluster/week22-public-${count.index + 1}" = "shared"
  }
}

resource "aws_route_table" "week22_public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "week22-public"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.week22_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.week22_internet_gateway.id
}

