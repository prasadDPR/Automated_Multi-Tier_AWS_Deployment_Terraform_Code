variable "private_key_path" {
  description = "Path to the SSH private key file"
  default     = "C:/Users/Dell/key/aws_us.pem"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}
