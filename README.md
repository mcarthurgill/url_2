url_2
=====

Added users to the url shortener. 

I didn't add a signup on the front page, so you have to go to localhost:9393/users/new
to sign up. 

It's janky, I know. 

Steps to run:
-------------
clone the repo

cd into the repo

run bundle install

run rake db:create

run rake db:migrate

run shotgun

then go to localhost:9393
