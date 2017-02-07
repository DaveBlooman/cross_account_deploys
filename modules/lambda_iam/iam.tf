resource "aws_iam_role" "lambda_assume_role" {
  name = "lambda-assume-role"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.account_id}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda_assume_role" {
  name       = "assume-role-attachment"
  roles      = ["${aws_iam_role.lambda_assume_role.name}"]
  policy_arn = "${aws_iam_policy.lambda_assume_role.arn}"
}

resource "aws_iam_policy" "lambda_assume_role" {
  name        = "lambda-assume-policy"
  description = "Lambda assume role policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "lambda:*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:PassRole"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeSecurityGroups"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeSubnets"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeVpc*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
