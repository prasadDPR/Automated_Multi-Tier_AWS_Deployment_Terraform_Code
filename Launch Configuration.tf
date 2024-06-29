resource "aws_launch_configuration" "private_lc" {
  name            = "private-lc"
  image_id        = "ami-04e5276ebb8451442"
  instance_type   = "t2.micro"
  key_name        = "aws_bank_key"
  security_groups = [aws_security_group.private-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Script to deploy Apache HTTP Server, clone a GitHub repository, and install MySQL

              # Install Apache HTTP Server
              sudo dnf install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd

              # Clone the GitHub repository
              sudo git clone https://github.com/prasadDPR/website.git /var/www/html/

              # Set permissions if needed
              sudo chown -R apache:apache /var/www/html/

              # Restart Apache to apply changes
              sudo systemctl restart httpd

              # Download the MySQL repository package
              wget https://dev.mysql.com/get/mysql80-community-release-el9-5.noarch.rpm

              # Install the MySQL repository package
              sudo dnf install mysql80-community-release-el9-5.noarch.rpm -y

              # Enable the MySQL community repository
              sudo dnf repolist enabled | grep "mysql.*-community.*"

              # Install MySQL
              sudo dnf install mysql -y
              EOF
}
