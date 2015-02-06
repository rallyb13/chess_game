#Active Record Chess Game
A chess game using ActiveRecord and Sinatra written over three days by four folks
as an exercise for Epicodus programming school.

##Setup Instructions:

###Gems Used:
```
sinatra
sinatra-contrib
sinatra-activerecord
rake
pg
pry
rspec
shoulda-matchers
```
###Install Bundler:
```
$ gem install bundler
```
###Run Bundler:
```
$ bundle
```
###Start the database:
```
$ postgres
```
###Create databases:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
###Run the Sinatra application:
```
$ ruby app.rb

Navigate to `localhost:4567` with a browser and enjoy!
```
###Bug Reports
```
Pawn movement has some know glitches.  In particular, moving from (1,2) to (2,4).
```
###Authors

Jackie Fletcher, Alex Kaufman, Benjamin Herson, and Gabe Finch

####MIT License
