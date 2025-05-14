output "backend_instance_ips" {
  value = [
    aws_instance.backend_1.public_ip,
    aws_instance.backend_2.public_ip
  ]
}

output "iam_access_key_id" {
  value = aws_iam_access_key.media_user_key.id
}

output "iam_secret_access_key" {
  value     = aws_iam_access_key.media_user_key.secret
  sensitive = true
}