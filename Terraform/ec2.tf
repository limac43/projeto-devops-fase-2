resource "aws_instance" "website_server" {
  ami           = "ami-01c265752adadcdf8"
  instance_type = "t3.micro"
  key_name = "chave-site-prod"
  vpc_security_group_ids = [aws_security_group.website_sg.id]
  iam_instance_profile = "ECR-EC2-Role"

  tags = {
    Name = "website-server"
    Provisoned = "Terraform"
    Cliente = "Luiz"
  }
}&&