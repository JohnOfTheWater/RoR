require 'spec_helper'

describe Recipe do
  #pending "add some examples to (or delete) #{__FILE__}"
  context ".find_by_id" do
    context "empty db" do
      it "should return nil" do
        Recipe.find_by_id(1).should be_nil
      end
    end
    context "with multiple recipes in the database" do
      let!(:aaa){Recipe.new}
      it "should return the recipe named ciao" do
        aaa.update_attributes(:recipe_name => "ciao")
        aaa.recipe_name.should == "ciao"
      end
      it "should not be named ciao" do
        y = Recipe.new
        y.update_attributes(:recipe_name => "lollo")
        y.recipe_name.should_not == "ciao"
      end
    end
  end

  context ".find_by_recipe_name" do
    context "empty db" do
      it "should return nil" do
        Recipe.find_by_recipe_name("yup").should be_nil
      end
    end
    context "with multiple recipes in the database" do
      let!(:aaa){Recipe.new}
      let!(:bbb){Recipe.new}
      it "should return the recipe named ciao" do
        aaa.update_attributes(:recipe_name => "ciao")
        Recipe.find_by_recipe_name("ciao").should == aaa
      end
    end
  end

end
