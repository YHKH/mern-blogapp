provider "aws" {
  region = "eu-north-1"
}

#resource "aws_s3_bucket" "frontend_bucket" {
  #bucket = "yahya-blogapp-frontend-new"
  #force_destroy = true

  #tags = {
    #Name        = "Frontend Bucket"
    #Environment = "Dev"
  #}
#}

#resource "aws_s3_bucket_ownership_controls" "frontend_bucket_controls" {
  #bucket = aws_s3_bucket.frontend_bucket.id

  #rule {
    #object_ownership = "BucketOwnerPreferred"
  #}
#}

#resource "aws_s3_bucket_acl" "frontend_acl" {
  #depends_on = [aws_s3_bucket_ownership_controls.frontend_bucket_controls]
  #bucket     = aws_s3_bucket.frontend_bucket.id
  #acl        = "public-read"
#}

#resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  #bucket = aws_s3_bucket.frontend_bucket.id

  #policy = jsonencode({
    #Version = "2012-10-17"
    #Statement = [
      #{
        #Sid       = "PublicReadGetObject"
        #Effect    = "Allow"
        #Principal = "*"
        #Action    = ["s3:GetObject"]
        #Resource  = "${aws_s3_bucket.frontend_bucket.arn}/*"
      #}
    #]
  #})
#}

#resource "aws_s3_object" "frontend_index" {
  #bucket = aws_s3_bucket.frontend_bucket.id
  #key    = "index.html"
  #source = "${path.module}/Frontend/index.html"
  #acl    = "public-read"
  #content_type = "text/html"
#}