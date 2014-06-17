require 'spec_helper'

feature "User edits account" do

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
    click_link "Delete"
    page.should have_content "Are you sure you want to delete the recipe banana?"
    click_button "Delete Recipe"
    page.should have_content "Recipe 'banana' destroyed successfully"
    page.should have_link "Add Recipe"
    #save_and_open_page
  end

end
