#TF File for IAM Users and Groups

resource "aws_iam_user" "developeruser1" {
  name = "kemzy"
}

resource "aws_iam_user" "developeruser2" {
  name = "sandra"
}

# Group TF Definition
resource "aws_iam_group" "developergroup" {
  name = "developers"
}

#Assign User to AWS Group
resource "aws_iam_group_membership" "developer-users" {
  name = "developer-users"
  users = [
    aws_iam_user.developeruser1.name,
    aws_iam_user.developeruser2.name,
  ]
  group = aws_iam_group.developergroup.name
}

#Policy for AWS Group
resource "aws_iam_policy_attachment" "developer-users-attach" {
  name       = "developer-users-attach"
  groups     = [aws_iam_group.developergroup.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}