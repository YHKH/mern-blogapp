resource "aws_iam_user" "media_user" {
  name          = "media-upload-user"
  force_destroy = true
}

resource "aws_iam_policy" "media_policy" {
  name        = "MediaS3UploadPolicy"
  description = "Policy to allow media upload to specific S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowMediaUpload"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetObject"
        ]
        Resource = "arn:aws:s3:::yahya-blogapp-media-new/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "media_policy_attach" {
  user       = aws_iam_user.media_user.name
  policy_arn = aws_iam_policy.media_policy.arn
}

resource "aws_iam_access_key" "media_user_key" {
  user = aws_iam_user.media_user.name
}

#resource "aws_s3_bucket" "media_bucket" {
  #bucket = "yahya-blogapp-media-new"
  #acl    = "private"
#}