apply:
	terraform apply -var-file="values.tfvars" -auto-approve
build_zips:
	rm -f ../backend_flask/flask_files.zip
	rm -f ../stripe_api/go_stripe_files.zip
	zip -r ../backend_flask/flask_files.zip ../backend_flask/
	zip -r ../stripe_api/go_stripe_files.zip ../stripe_api/
import: 
	terraform import -var-file=./values.tfvars google_app_engine_application.app app 
.PHONY: apply build_zips import