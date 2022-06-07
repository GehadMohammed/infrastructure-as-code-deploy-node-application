

# data "aws_cloudwatch_log_group" "radis-log" {
#   name = "MyImportantLogs"
# }

# resource "aws_elasticache_cluster" "radis" {
#   cluster_id        = "mycluster"
#   engine            = "redis"
#   node_type         = "cache.t3.micro"
#   num_cache_nodes   = 1
#   port              = 6379
#   apply_immediately = true
 
#   log_delivery_configuration {
#     destination      = aws_cloudwatch_log_group.radis-log.name
#     destination_type = "cloudwatch-logs"
#     log_format       = "text"
#     log_type         = "slow-log"
#   }
# }

# resource "aws_security_group" "default" {
#   name_prefix = "radis-sg"
#   vpc_id      = module.network.vpc-01-id

#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


# module "redis" {
#   source = "umotif-public/elasticache-redis/aws"
#   version = "~> 2.1.0"

#   name_prefix           = "core-example"
#   number_cache_clusters = 2
#   node_type             = "cache.t3.small"

#   engine_version           = "6.x"
#   port                     = 6379
#   maintenance_window       = "mon:03:00-mon:04:00"
#   snapshot_window          = "04:00-06:00"
#   snapshot_retention_limit = 7

#   automatic_failover_enabled = true

#   at_rest_encryption_enabled = true
#   transit_encryption_enabled = true
#   auth_token                 = "1234567890asdfghjkl"

#   apply_immediately = true
#   family            = "redis6.x"
#   description       = "Test elasticache redis."

#   subnet_ids = [ module.network.private-subnet-01-id , module.network.private-subnet-02-id ]
#   vpc_id     = module.network.vpc-01-id

#   ingress_cidr_blocks = ["0.0.0.0/0"]

#   parameter = [
#     {
#       name  = "repl-backlog-size"
#       value = "16384"
#     }
#   ]

#   tags = {
#     Project = "Test"
#   }
# }