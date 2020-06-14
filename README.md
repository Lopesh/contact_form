# README

The steps are necessary to get the application up and running.

* Github 
* Ruby version
	- 2.7.0
* Rails version 
	- 6.3.0
1. Check out the repository
	git clone https://github.com/Lopesh/contact_form.git 
	or
	You can also download directly from using link https://github.com/Lopesh/contact_form.git  
2. Setup the database 
	- as per mysql db creadentials available in database.yml file replace your mysql server creadentials or keep as available in file.

3. Run the following commands to create database and install all required Gems repository.
	bundle install 	
	rake db:create
	rake db:migrate	
	
4. Start the Rails server
You can start the rails server using the command given below.
    rails s

And now you can visit the site with the URL http://localhost:3000/contact

Note: If we want to sent mail then need smtp server creadentials username and password.so that mails will sent to users once it done otherwise mail will not sent to customer.

Eg. SentGrid setup 

In config/environments/development.rb file -

below details are required to sent mail using sentgrid:

  config.action_mailer.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => ENV["EMAIL"],   #specify your username here
    :password             => ENV["PASSWORD"], #specify your password here 
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }