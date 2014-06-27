require 'spec_helper'

feature "User click show" do

  background do #<-- rspec
    User.create(email: "joe@example.com", password: "mypassword", username: "kong")
    x = Recipe.create(recipe_name: "banana", description: "bona", ingredients: "a banana", preparation: "peal it, eat it", tags: "frutta", user: "kong", image: "banana_pic")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
  end


  scenario "happy path" do
    visit recipes_path
    click_link "Show"
    page.should_not have_link "<< Back to Recipes List"
    page.should have_content "banana"
    #save_and_open_page

    page.should_not have_button("Update Recipe!")
    page.should have_button("Comment")
  end

end
