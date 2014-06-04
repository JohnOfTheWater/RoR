require 'spec_helper'

feature "New recipe" do

  background do
    User.create(email: "joe@example.com", password: "mypassword")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
  end

  scenario "user creates a new recipe" do
    click_link "Add a Recipe"
    fill_in "recipe[recipe_name]", with: "Text input with body for test!"
    fill_in "recipe[description]", with: "Text input with body for test!"
    fill_in "recipe[preparation]", with: "Text input with body for test!"
    fill_in "recipe[tags]", with: "Text input with body for test!"
    #save_and_open_page
    click_button "Add Recipe!"
    page.should have_content "Recipe created successfully"
    #current_path.should == posts_path
    page.should have_content "Recipes"
  end
end
=begin
  scenario "user fails to create a new post" do
    click_link "write a squmbl"
    fill_in "Content", with: ""
    click_button "create squmbl"
    page.should have_content "Your squmbl could not be created"
    page.should have_error("can't be blank", on: "Content")
  end

  scenario "if I'm not logged in" do
    visit root_path
    page.should_not have_content("write a squmbl")

    visit posts_path
    page.should_not have_content("new squmbl")

    visit new_post_path
    current_path.should == new_user_session_path
    page.should have_content("You need to sign in or sign up before continuing.")
  end
end
=end
