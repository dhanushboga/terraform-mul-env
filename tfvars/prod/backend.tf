bucket         = "82s-chenchu-state-prod"
key            = "expense-infra-prod" #unique keys within the bucket and same key cannot be use
region         = "us-east-1"
dynamodb_table = "82s-chenchu-prod"


# terraform init -backend-config=prod/backend.tf