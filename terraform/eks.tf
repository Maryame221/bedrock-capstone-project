module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  #Core Cluster config
  cluster_name    = "project-bedrock-cluster"
  cluster_version = "1.35"

  enable_cluster_creator_admin_permissions = true

  #Enable CloudWatch control plane logs 
  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]


  #Networking
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true


  #Endpoint access
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  #Node groups
  eks_managed_node_groups = {
    default = {
      name = "bedrock-ng"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 2

      ami_type = "AL2023_x86_64_STANDARD"
    }
  }

  #Access control
  access_entries = {

    admin = {

      principal_arn = "arn:aws:iam::975050041392:root"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }

    developer = {

      principal_arn = aws_iam_user.developer.arn

      policy_associations = {

        view = {

          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  #Tags
  tags = {
    Project = "karatu-2025-capstone"
  }
}