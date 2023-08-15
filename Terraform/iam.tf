# Create instance profile role for EC2 instance
resource "aws_iam_role" "IAMInstanceProfileRole" {
  name = "IAMInstanceProfileRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach S3FullAccess permission to EC2 instance role
resource "aws_iam_role_policy_attachment" "s3fullaccessattach" {
  role       = aws_iam_role.IAMInstanceProfileRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Attach RDSreadonly permission to EC2 instance role
resource "aws_iam_role_policy_attachment" "rdsreadonlyattach" {
  role       = aws_iam_role.IAMInstanceProfileRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

# Create EC2 instance profile
resource "aws_iam_instance_profile" "IAMinstanceprofile" {
  name = "IAMinstanceprofile"
  role = aws_iam_role.IAMInstanceProfileRole.name
}