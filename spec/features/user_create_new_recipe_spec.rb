require 'spec_helper'

feature "New recipe" do

  background do
    User.create(email: "joe@example.com", password: "mypassword", username: "pippo")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
  end

  scenario "user creates a new recipe" do
    visit recipes_path
    click_link "+ Recipe"
    fill_in "recipe[recipe_name]", with: "body for test!"
    fill_in "recipe[description]", with: "Text input with body for test!"
    fill_in "recipe[ingredients]", with: "Text input with body for test!"
    fill_in "recipe[preparation]", with: "Text input with body for test!"
    fill_in "recipe[tags]", with: "Text input with body for test!"
    #save_and_open_page
    click_button "Add Recipe!"
    current_path.should == recipes_path
    page.should have_content "Recipes"
  end

  scenario "user creates a new recipe" do
    visit recipes_path
    click_link "+ Recipe"
    fill_in "recipe[recipe_name]", with: "body for test!"
    fill_in "recipe[description]", with: "Text input with body for test!"
    fill_in "recipe[ingredients]", with: "Text input with body for test!"
    fill_in "recipe[preparation]", with: "Text input with body for test!"
    fill_in "recipe[tags]", with: "Text input with body for test!"
    fill_in "recipe[ready_in]", with: "30 min"
    fill_in "recipe[servings]", with: "4"
    #save_and_open_page
    click_button "Add Recipe!"
    current_path.should == recipes_path
    page.should have_content "Recipes"
  end

end
