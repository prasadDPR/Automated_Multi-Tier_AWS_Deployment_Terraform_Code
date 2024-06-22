resource "aws_launch_configuration" "private_lc" {
  name            = "private-lc"
  image_id        = "ami-04e5276ebb8451442"
  instance_type   = "t2.micro"
  key_name        = "aws_bank_key"
  security_groups = [aws_security_group.private-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              # Script to deploy a color web server using Python Flask and install MySQL

              # Install Python Flask
              sudo yum install -y python3-pip
              pip3 install flask

              # Create the Flask web server script
              cat > /home/ec2-user/color_webserver.py << 'EOL'
              from flask import Flask
              import random

              app = Flask(__name__)

              @app.route('/')
              def get_color():
                  colors = ['red', 'green', 'blue']
                  return f'<h1 style="color:{random.choice(colors)}">Highly Available Three-Tier Architecture in AWS using Terraform: Designed and Implemented by Prasad</h1>'

              if __name__ == '__main__':
                  app.run(host='0.0.0.0', port=80)
              EOL

              # Run the Flask web server
              nohup python3 /home/ec2-user/color_webserver.py &

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
