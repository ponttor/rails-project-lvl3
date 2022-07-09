setup:
	bin/setup
	bin/rails db:fixtures:load

console:
	bin/rails console

seed:
	bin/rails db:fixtures:load

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop

correct:
	bundle exec rubocop -A

start:
	bin/rails s

deploy:
	git push heroku main

env:
	include $(HOME)/.env

heroku-start:
	heroku local

heroku-dbm:
	heroku run rake db:migrate

heroku-console:
	heroku run rails console

heroku-seed:
	heroku run rake db:seed

heroku-logs:
	heroku logs --tail

.PHONY: test






