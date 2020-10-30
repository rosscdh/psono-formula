.PHONY: bundle_install tests virtualenv setup 

bundle_install:
	bundle install

virtualenv:
	virtualenv venv -p python3
	venv/bin/pip install -r requirements.txt

setup: bundle_install virtualenv

tests:
	bundle exec kitchen converge
	bundle exec kitchen verify all
	

