#!/bin/bash

echo "Launcher....."

echo -e "\n"

echo "cerco se ci sono Bastian Host già esistenti.... "

n_instances=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=BastionHost" "Name=instance-state-name,Values=running" --output text | wc -l)

if ["$n_instances" -g 0 ]; then
    
    echo "esiste gia un istanza Bastian Host ...."

else

    echo "Non sono state trovate istanze BastianHost ...... "
    echo "\n" 

    echo "esecuzione terraform ...."
    
    echo "esecuzione Terraform init "
    terraform init 

    echo "esecuzione Terraform plan "    
    terraform plan > ./log/log-plan.txt 2>&1

    echo "esecuzione Terraform apply "
    terraform apply -auto-approve > ./log/log-apply.txt 2>&1


    echo "esecuzione riuscita ....."

fi
