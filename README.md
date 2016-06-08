You can view this website through public key: https://stark-ridge-30136.herokuapp.com/

# Project Idea:
Superhuman Registration Act. Building this website to register all Marvel's heroes. Including
their personal identity infomation, affiliations and the movie they attend. After sign in, user could use 'pay attention to' function to follow the guy who may want to do some big things:)

# How to run the test suite

To run on local system using web browser (localhost:3000), clone the repository to desktop, run bundle install –without production, rake db:migrate, rake db:seed.

# Database creation

* Many-to-many model association: Users and Hero through Attention

### User 
	* Review all heroes and inspect some of them.
### Hero
	* Including all heroes' identity info
### Affiliations
	* The affiliations just like revengers
### Movie
	* Movie they attent
### Attention
	* Inspect the heores


# Ruby version
	* Ruby 4.2.6



Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
