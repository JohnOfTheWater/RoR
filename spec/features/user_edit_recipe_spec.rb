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
    click_link "Edit"
    fill_in "recipe[recipe_name]", with: "banana pudding"
    fill_in "recipe[ingredients]", with: "put some pudding on your banana"
    click_button "Update Recipe!"
    #save_and_open_page
    page.should have_content "Recipe updated successfully"

    page.should_not have_button("Update Recipe!")
    page.should have_content "Recipe updated successfully"
    page.should have_button("Comment")
  end

  scenario "change servings and ready time" do
    visit recipes_path
    click_link "Edit"
    fill_in "recipe[recipe_name]", with: "banana pudding"
    fill_in "recipe[ingredients]", with: "put some pudding on your banana"
    fill_in "recipe[ready_in]", with: "30 min"
    fill_in "recipe[servings]", with: "3"
    click_button "Update Recipe!"
    #save_and_open_page
    page.should have_content "Recipe updated successfully"

    page.should_not have_button("Update Recipe!")
    page.should have_content "Recipe updated successfully"
    page.should have_button("Comment")
  end

end
