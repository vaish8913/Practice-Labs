output "ec2_public_ip" {
  value = aws_instance.demo.public_ip
}
output "bucket_name" {
  value = var.bucket_name
}
