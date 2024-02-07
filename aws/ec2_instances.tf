resource "aws_instance" "openshift_ec2" {
  ami                         = "ami-05f804247228852a3"
  instance_type               = var.aws_instance_type
  key_name                    = aws_key_pair.openshift_kp.key_name
  availability_zone           = var.aws_availability_zone
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.openshift_subnet.id
  vpc_security_group_ids      = [aws_security_group.openshift_sg.id]

  root_block_device {
    volume_size = var.aws_volume_size
    tags = {
      Name  = "${var.owner}-openshift-ebs-root-tf"
      Owner = var.owner
    }
    delete_on_termination = true
  }

  tags = {
    Name  = "${var.owner}-openshift-ec2-tf"
    Owner = var.owner
  }

}