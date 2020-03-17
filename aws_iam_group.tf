resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}

# now add all developers to the developers group
resource "aws_iam_group_membership" "developers_group_membership" {
  name = "developers-group-membership"

  users = [
    aws_iam_user.developer1.name,
    aws_iam_user.developer2.name,
  ]

  group = aws_iam_group.developers.name
}

# attach a policy to the group
resource "aws_iam_group_policy" "developers_group_policy" {
  name = "developers_group_policy"
  group = aws_iam_group.developers.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}