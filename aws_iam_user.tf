resource "aws_iam_user" "developer1" {
  name = "developer1"
  path = "/users/"
}

resource "aws_iam_user" "developer2" {
  name = "developer2"
  path = "/users/"
}
