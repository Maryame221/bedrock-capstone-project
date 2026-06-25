resource "aws_iam_user" "developer" {
  name = "bedrock-dev-view"

  tags = {
    Project = "karatu-2025-capstone"
  }
}

resource "aws_iam_user_policy_attachment" "readonly" {
  user       = aws_iam_user.developer.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_iam_policy_document" "s3_put" {
  statement {
    effect = "Allow"

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.assets.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_put" {
  name_prefix = "bedrock-dev-view-s3-put-"
  policy      = data.aws_iam_policy_document.s3_put.json
}

resource "aws_iam_user_policy_attachment" "s3_put" {
  user       = aws_iam_user.developer.name
  policy_arn = aws_iam_policy.s3_put.arn
}