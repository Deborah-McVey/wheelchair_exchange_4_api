# README

#For your API,

#1.Describe the API and how it relates to the overall full stack project. Include the purpose, target audience and scope.

a. API is for user info, posts, and comments
b. This app is for people with good-condition wheelchairs to offer up for free.
c. It could be used on a website for DME or help for disabled people. 
d. The target audience would be the caregivers who would be able to pick up the equipment, and volunteers who want to help disabled people. 
e. The photos and descriptions would help people see if the wheelchair is the type they need.
f. The location will help decide if they will be able to pick it up.
g. The comments will help people connect and plan for pick-up. 
h. The post will have a status of "available". When the wheelchair leaves the hands of the person who made the post, they can change the status to "sold".

#2.Describe the API's architecture, including the main aspects of your application and how it interactions with your front end as well including authentication and authorization.

a. The API icludes 3 main tables: User, Post, Comment.
b. User includes columns: first_name, last_name, email, password, password confirmation
c. Post includes columns: photo, description, location, status
d. Comment includes body.
e. The schema also icludes tables for active_storage to upload photos.

#3.Describe the setup instructions to start the project.

a. Ubuntu terminal
b. ran rails new wheelchair_exchange_4_api --api -T
c. opened in VSCode
d. uncommented or added to Gemfile
e. opened VSCode terminal
f. bundle i
e. rails g rspec:install
g. rails active_storage:install

#4.Refer to the set of gems utilized in the project other than the default added gems.

a. uncommented bcrypt and rack-cors
b. added jwt, kaminari, blueprinter
c. added rails-rspec, factory_bot_rails, and faker to test development
d. to delploy move sqlite3 to development test, and add pg to production

#5.Describe testing made in your API.

a. spec file created from running rails g rspec:install
b. factories created from gem factory_bot_rails 
c. factories, models, and requests created for models
d. rails-helper and spec-helper
e. created spec/requests/sessions_spec for JWT auth
 
#6.Please include the url to your Front end Project's repository

https://github.com/Deborah-McVey/wheelchair_exchange_3_client


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions (Prepare for deploy with Render)
a. moved sqlite3 to development test, added gem 'pg' to production
b. config/database.yml
c. add render-build.sh to bin folder
d. render.yaml
e. commit to Github
f. Render > Dashboard > Blueprints > new blueprint instance > 
g. Configuration Add your env variables to the config/credentials.yml.enc file. You can do this by running EDITOR="code --wait" bin/rails credentials:edit

* ...