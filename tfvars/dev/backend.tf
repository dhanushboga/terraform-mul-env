bucket         = "82s-chenchu-state-dev"
key            = "expense-infra-dev" #unique keys within the bucket and same key cannot be use
region         = "us-east-1"
dynamodb_table = "82s-chenchu-dev"


# terraform init -backend-config=dev/backend.tf

# terraform plan -var-file=dev/dev.tfvars

# terraform init -reconfigure -backend-config=prod/backend.tf

# terraform init -reconfigure -backend-config=dev/backend.tf

# terraform apply -var-file=dev/dev.tfvars -auto-approve