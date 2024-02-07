resource "aws_key_pair" "openshift_kp" {
  key_name   = "${var.owner}-openshift-kp-tf"
  public_key = file("~/.ssh/id_rsa.pub")
  tags = {
    Name  = "${var.owner}-openshift-kp-tf"
    Owner = var.owner
  }
}
