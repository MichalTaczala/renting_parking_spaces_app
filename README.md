# Intro
TODO

# Development

### TODO
- [ ] do tworzenia parking spot model dodac odrazu tworzenie nowego adresu: zagniezdzony json - najpierw parking spot potem adres - ew dopytac Michala (TODO: sprawdzanie czy istnieje taki sam adres, jak tak wziac id, jak nie stworzyc nowy)
- [ ] w parking spot response dla GET dodac lista LINKI jakies tajemnicze do obrazkow  (do poj.)

### Connecting with Postgres DB
`gcloud sql connect my-sql-instance --user=postgres --database=my_app_db`

### Changes in Terraform
terraform apply -var-file="values.tfvars"
add app_key.json to terraform_conf
