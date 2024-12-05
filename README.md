# web-app-on-aws
Flask + celery + redis + nginx running on ecs with RDS behind A load balancer


to run locally, run with postgres container

docker run --name flask_postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=postgres -p 5432:5432 -d postgres

# redis

docker run --name flask_redis -p 6379:6379 -d redis

# ecr login 

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 366140438193.dkr.ecr.ap-south-1.amazonaws.com





# run terraform 

terraform init -backend-config=vars/dev.tfbackend

terraform plan -var-file=vars/dev.tfvars

terraform apply -var-file=vars/dev.tfvars

# On prod 

terraform init -backend-config=vars/prod.tfbackend

terraform plan -var-file=vars/prod.tfvars

terraform apply -var-file=vars/prod.tfvars

