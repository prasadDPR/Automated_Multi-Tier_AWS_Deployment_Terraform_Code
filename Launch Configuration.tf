resource "aws_launch_configuration" "private_lc" {
  name            = "private-lc"
  image_id        = "ami-04e5276ebb8451442"
  instance_type   = "t2.micro"
  key_name        = "aws_bank_key"
  security_groups = [aws_security_group.private-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Script to clone the website repository from GitHub and install MySQL

              # Install git
              sudo yum install -y git

              # Clone the website repository
              git clone https://github.com/prasadDPR/website.git /home/ec2-user/website

              # Change to the website directory
              cd /home/ec2-user/website
              
              # Example: If your website requires specific setup commands, add them here
              # ./setup.sh

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
