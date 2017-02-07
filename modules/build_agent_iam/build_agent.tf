resource "aws_iam_role" "build_agent_access" {
  name = "build_agent_access"

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

resource "aws_iam_role_policy" "build_agent_access" {
  name = "ci-agent-access-policy"
  role = "${aws_iam_role.build_agent_access.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::${var.account_a_id}:role/lambda_assume_role"
    },
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::${var.account_b_id}:role/lambda_assume_role"
    }
  ]
}
EOF
}
