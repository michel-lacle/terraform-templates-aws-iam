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
