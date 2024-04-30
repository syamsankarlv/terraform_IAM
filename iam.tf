resource "aws_iam_user" "IAM_Users" {
  for_each = toset(var.username)

  name = each.key
}


output "user_details" {
  value = {
    for username, user in aws_iam_user.IAM_Users :
    username => user.name
  }
}


resource "aws_iam_policy" "ec2_policy" {
  name        = "ec2_policy"
  description = "Allows describing EC2 instances"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = "ec2:Describe*",
      Resource = "*",
    }],
  })
}


 resource "aws_iam_policy_attachment" "ec2_policy_attachment" {
  for_each = aws_iam_user.IAM_Users

  name       = "Policy_attachment_${each.key}"
  policy_arn = aws_iam_policy.ec2_policy.arn
  users      = [each.value.name]

lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_iam_user.IAM_Users]
}

