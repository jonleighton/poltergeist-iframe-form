require './iframe_form.rb'
require 'rspec'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/poltergeist'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.app = IframeForm
Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, { :debug => true })
end

describe IframeForm do
  include Rack::Test::Methods

  def app
    IframeForm
  end

  describe "filling in a form field" do
    it "should support one page", :type => :feature, :js => true do
      visit '/c'
      fill_in("c_field", :with => "the lazy cat jumped over the brown fox")
      page.find(:css, "#c_field").value.should == "the lazy cat jumped over the brown fox"
    end

    it "should support an iframe on the page", :type => :feature, :js => true do
      visit '/b'

      within_frame("c_frame") do
        fill_in("c_field", :with => "the lazy cat jumped over the brown fox")
        page.find(:css, "#c_field").value.should == "the lazy cat jumped over the brown fox"
      end
    end

    it "should support an iframe in an iframe on the page", :type => :feature, :js => true do
      visit '/a'

      within_frame("b_frame") do
        within_frame("c_frame") do
          fill_in("c_field", :with => "the lazy cat jumped over the brown fox")
          page.find(:css, "#c_field").value.should == "the lazy cat jumped over the brown fox"
        end
      end
    end
  end

end