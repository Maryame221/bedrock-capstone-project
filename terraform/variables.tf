variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "project-bedrock"
}

variable "student_id" {
  description = "Student ID formatted for S3 bucket naming"
  type        = string
  default     = "alt-soe-025-3937"
}