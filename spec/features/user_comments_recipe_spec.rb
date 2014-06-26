require 'spec_helper'

feature "User comments recipe" do

  background do #<-- rspec
    User.create(email: "joe@example.com", password: "mypassword", username: "kong")
    Recipe.create(recipe_name: "banana", description: "bona", ingredients: "a banana", preparation: "peal it, eat it", tags: "frutta", user: "kong", image: "banana_pic")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
  end

  scenario "happy path" do
    click_link "Recipes"
    click_link "My Recipes"
    click_link "Show"
    fill_in "Comment", with: "bananaaaaaaaa!!!"
    click_button "Comment"
    #save_and_open_page

    page.should have_content "Your comment has been created"
  end

  scenario "another happy path" do
    click_link "Recipes"
    click_link "My Recipes"
    click_link "Show"
    fill_in "Comment", with: "more bananaaaaaaaas!!!"
    click_button "Comment"
    #save_and_open_page

    page.should have_content "Your comment has been created"
  end

end
