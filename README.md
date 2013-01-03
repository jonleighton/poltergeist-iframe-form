# Description

I am using this app to track down an issue with Poltergeist/PhantomJS.

Issue:  Filling in a form which is 2 iframes deep gives odd results.  Only some of the characters
are entered into the form field.

# Installation

~~~
brew install phantomjs
bundle install
~~~

# Run the rspec tests

~~~
bundle exec rspec iframe_form_spec.rb
~~~

# Run the app in a browser

~~~
bundle exec shotgun
# go to http://127.0.0.1:9393/a
~~~


