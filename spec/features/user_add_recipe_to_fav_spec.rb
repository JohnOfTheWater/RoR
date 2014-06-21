require 'spec_helper'

feature "User add recipe to fav recipe" do

  background do #<-- rspec
    User.create(email: "joe@example.com", password: "mypassword", username: "kong")
    x = Recipe.create(recipe_name: "banana", description: "bona", ingredients: "a banana", preparation: "peal it, eat it", tags: "frutta", user: "kong", image: "banana_pic.jpg")
    y = FavRecipe.create(recipe_name: "banana", description: "bona", ingredients: "a banana", preparation: "peal it, eat it", tags: "frutta", user: "kong", image: "banana_pic.jpg")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "mypassword"
    click_button "Sign in"
  end
# how I test ajax call????
  scenario "happy path" do
    click_link "Recipes"
    within(".recipe_wrap") do
      click_on("Show")
    end
    page.should have_content "banana"
    page.should have_content "frutta"
    expect(page).to have_content 'INGREDIENTS'

  end

  scenario "another happy path" do
    click_link "Recipes"
    click_link "Edit"
    expect(page).to have_content 'a banana'

    page.should have_content "Tags"
    #save_and_open_page
  end

  scenario "the real deal" do
    click_link "Favorites"
    expect(page).to have_content 'banana'
    page.should have_content "bona"
    page.should have_content "frutta"
    #save_and_open_page
  end

  scenario "the real shit" do
    click_link "Favorites"
    expect(page).to_not have_content 'avocado'

    page.should_not have_content "Tags"
    page.should_not have_content "car"
    #save_and_open_page
  end

end
