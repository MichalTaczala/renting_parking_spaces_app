# Intro
TODO

# Development

### TODO
- [] TODO: change parking spot model - nowy od michala + CZY MA ON CENE (za godzine) 
- [] do tworzenia parking spot model dodac odrazu tworzenie nowego adresu: zagniezdzony json - najpierw parking spot potem adres - ew dopytac Michala
- [] dopytac michala o autentykacje usera jak to kurwa dziala - dp tworzenia usera
- [] requesty wrzucic do postmana? - chyba niekoniecznie (jakby sie komus nudzilo)
- [] w parking spot model dodac LINKI jakies tajemnicze do obrazkow 
- [] foldery w cloud storage pod kazdy nowy parking spot
- [] przy tworzeniu parking on musi dostac zwrotne id parking, zeby zalaczyc wysylajac zdejcia
- [] jak wysylamy parking spot list to wyslac tez odkleglosc od celu na podstawie lokalizacji uzytkownika (+ w pojedynczym)
- [] do wysylania parking spotow dodac filtry 
DateTime? startDate, DateTime? endDate, double? lat, double? long): wszystkie sa nullable 

### Connecting with Postgres DB
`gcloud sql connect my-sql-instance --user=postgres --database=my_app_db`

### Changes in Terraform
terraform apply -var-file="values.tfvars"
add app_key.json to terraform_conf
