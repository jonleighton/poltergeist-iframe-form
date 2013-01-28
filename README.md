# Description

I am using this app to track down an issue with Poltergeist/PhantomJS.

Issue:  Filling in a form which is 2 iframes deep gives odd results.  Only some of the characters
are entered into the form field.

# Installation

~~~
brew install phantomjs
bundle install
~~~

# Run the phantomjs demo

~~~
bundle exec shutgun
phantomjs iframe_form.js # in another terminal
~~~

It should print "omg". Instead it prints "g". It seems that only the
final letter works.

# Run the rspec tests

~~~
bundle exec rspec iframe_form_spec.rb
~~~

# Run the app in a browser

~~~
bundle exec shotgun
# go to http://127.0.0.1:9393/a
~~~

# Poltergeist debug log from rspec run

~~~
$ bundle exec rspec --format documentation iframe_form_spec.rb

IframeForm
  filling in a form field
{"name"=>"visit", "args"=>["http://127.0.0.1:51277/c"]}
{"response"=>{"status"=>"success"}}
{"name"=>"find", "args"=>[".//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')][((./@id = 'c_field' or ./@name = 'c_field') or ./@id = //label[normalize-space(string(.)) = 'c_field']/@for)] | .//label[normalize-space(string(.)) = 'c_field']//.//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')]"]}
{"response"=>{"page_id"=>1, "ids"=>[0]}}
{"name"=>"visible", "args"=>[1, 0]}
{"response"=>true}
{"name"=>"tag_name", "args"=>[1, 0]}
{"response"=>"INPUT"}
{"name"=>"attribute", "args"=>[1, 0, "type"]}
{"response"=>"input"}
{"name"=>"set", "args"=>[1, 0, "the lazy cat jumped over the brown fox"]}
{"response"=>true}
{"name"=>"find", "args"=>[".//*[@id = 'c_field']"]}
{"response"=>{"page_id"=>1, "ids"=>[1]}}
{"name"=>"visible", "args"=>[1, 1]}
{"response"=>true}
{"name"=>"value", "args"=>[1, 1]}
{"response"=>"the lazy cat jumped over the brown fox"}
{"name"=>"reset", "args"=>[]}
{"response"=>true}
    should support one page
{"name"=>"visit", "args"=>["http://127.0.0.1:51277/b"]}
{"response"=>{"status"=>"success"}}
{"name"=>"push_frame", "args"=>["c_frame"]}
{"response"=>true}
{"name"=>"find", "args"=>[".//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')][((./@id = 'c_field' or ./@name = 'c_field') or ./@id = //label[normalize-space(string(.)) = 'c_field']/@for)] | .//label[normalize-space(string(.)) = 'c_field']//.//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')]"]}
{"response"=>{"page_id"=>2, "ids"=>[0]}}
{"name"=>"visible", "args"=>[2, 0]}
{"response"=>true}
{"name"=>"tag_name", "args"=>[2, 0]}
{"response"=>"INPUT"}
{"name"=>"attribute", "args"=>[2, 0, "type"]}
{"response"=>"input"}
{"name"=>"set", "args"=>[2, 0, "the lazy cat jumped over the brown fox"]}
{"response"=>true}
{"name"=>"find", "args"=>[".//*[@id = 'c_field']"]}
{"response"=>{"page_id"=>2, "ids"=>[1]}}
{"name"=>"visible", "args"=>[2, 1]}
{"response"=>true}
{"name"=>"value", "args"=>[2, 1]}
{"response"=>"the lazy cat jumped over the brown fox"}
{"name"=>"pop_frame", "args"=>[]}
{}
{"name"=>"reset", "args"=>[]}
{"response"=>true}
    should support an iframe on the page
{"name"=>"visit", "args"=>["http://127.0.0.1:51277/a"]}
{"response"=>{"status"=>"success"}}
{"name"=>"push_frame", "args"=>["b_frame"]}
{"response"=>true}
{"name"=>"push_frame", "args"=>["c_frame"]}
{"response"=>true}
{"name"=>"find", "args"=>[".//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')][((./@id = 'c_field' or ./@name = 'c_field') or ./@id = //label[normalize-space(string(.)) = 'c_field']/@for)] | .//label[normalize-space(string(.)) = 'c_field']//.//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')]"]}
{"response"=>{"page_id"=>3, "ids"=>[0]}}
{"name"=>"visible", "args"=>[3, 0]}
{"response"=>true}
{"name"=>"tag_name", "args"=>[3, 0]}
{"response"=>"INPUT"}
{"name"=>"attribute", "args"=>[3, 0, "type"]}
{"response"=>"input"}
{"name"=>"set", "args"=>[3, 0, "the lazy cat jumped over the brown fox"]}
{"response"=>true}
{"name"=>"find", "args"=>[".//*[@id = 'c_field']"]}
{"response"=>{"page_id"=>3, "ids"=>[1]}}
{"name"=>"visible", "args"=>[3, 1]}
{"response"=>true}
{"name"=>"value", "args"=>[3, 1]}
{"response"=>"x"}
{"name"=>"pop_frame", "args"=>[]}
{"response"=>false}
{"name"=>"pop_frame", "args"=>[]}
{}
{"name"=>"reset", "args"=>[]}
{"response"=>true}
    should support an iframe in an iframe on the page (FAILED - 1)

Failures:

  1) IframeForm filling in a form field should support an iframe in an iframe on the page
     Failure/Error: page.find(:css, "#c_field").value.should == "the lazy cat jumped over the brown fox"
       expected: "the lazy cat jumped over the brown fox"
            got: "x" (using ==)
     # ./iframe_form_spec.rb:46:in `block (5 levels) in <top (required)>'
     # ./iframe_form_spec.rb:44:in `block (4 levels) in <top (required)>'
     # ./iframe_form_spec.rb:43:in `block (3 levels) in <top (required)>'

Finished in 3.99 seconds
3 examples, 1 failure

Failed examples:

rspec ./iframe_form_spec.rb:40 # IframeForm filling in a form field should support an iframe in an iframe on the page
~~~


