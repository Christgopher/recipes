ENV['RACK_ENV'] = 'test'
require('capybara/rspec')
require('spec_helper')
require('./app')


Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("The path to the index page", {:type => :feature}) do
  it("displays links to the recipes and ingredients page") do
    visit('/')
    expect(page).to have_content("Recipe Box")
  end
end
