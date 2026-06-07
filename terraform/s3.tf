resource "aws_s3_bucket" "assets" {
  bucket = "bedrock-assets-${var.student_id}"

  tags = {
    Project = "karatu-2025-capstone"
  }
}