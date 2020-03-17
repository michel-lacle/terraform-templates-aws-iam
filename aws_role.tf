# this role allows EC2 instances to access s3
resource "aws_iam_role" "ec2-s3-role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
}
EOF
}

resource "aws_iam_policy" "s3-list-bucket-policy" {
  name        = "s3-list-buclket-test-policy"
  description = "An example S3 policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::terraform-examples.f1kart.com"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2-s3-role-attachment" {
  role       = aws_iam_role.ec2-s3-role.name
  policy_arn = aws_iam_policy.s3-list-bucket-policy.arn
}