terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}



provider "snowflake" {
  role  = "SYSADMIN"
  region = "US-EAST-2.aws"
  account= "LW55141"
  private_key_path = "C:/Program Files/OpenSSL-Win64/bin/snowflake_tf_snow_key.p8" 
  username = "tf-snow" 
}

resource "snowflake_database" "db" {
  name     = "TF_DEMO"
}

resource "snowflake_warehouse" "warehouse" {
  name           = "TF_DEMO"
  warehouse_size = "X-Small"

  auto_suspend = 60
}
resource "tls_private_key" "svc_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}