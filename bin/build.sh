#!/bin/bash

set -e

terraform plan
terraform apply -auto-approve