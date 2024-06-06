resource "aws_network_interface" "batch_net_interface" {
  subnet_id = aws_subnet.public_a.id
  security_groups = [
    aws_security_group.application_sg.id,
  ]
}

resource "aws_instance" "batch" {
  instance_type = "t2.micro"
  ami           = "ami-04607756254222deb"
  key_name      = aws_key_pair.kp.key_name

  network_interface {
    network_interface_id = aws_network_interface.batch_net_interface.id
    device_index         = 0
  }
  tags = {
    Name = "${var.prefix}-batch"
  }
}

resource "aws_eip" "batch_eip" {
  instance = aws_instance.batch.id
}
