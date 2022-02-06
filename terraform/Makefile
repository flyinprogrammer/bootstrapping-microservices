init:
	terraform init

plan:
	terraform plan -out=tfplan

apply:
	terraform apply tfplan

destroy:
	terraform destroy

fmt:
	terraform fmt -recursive .

acr_login:
	az acr login -n $(shell terraform output -raw registry_name)

acr_check_health:
	az acr check-health -n $(shell terraform output -raw registry_name) --yes

acr_server:
	az acr show -n $(shell terraform output -raw registry_name) --query loginServer --out tsv

