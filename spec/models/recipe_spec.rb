require 'spec_helper'

describe Recipe do
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
      it "should return the default recipe rating" do
        aaa.rating.should == 3
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

  context ".find_by_user" do
    context "empty db" do
      it "should return nil" do
        Recipe.find_by_user("ryu").should be_nil
      end
    end
    context "with multiple recipes in the database" do
      let!(:aaa){Recipe.new}
      let!(:bbb){Recipe.new}
      it "should return the recipe named ciao" do
        aaa.update_attributes(:user => "ryu")
        Recipe.find_by_user("ryu").should == aaa
      end
    end
  end

  context ".find_by_tags" do
    context "empty db" do
      it "should return nil" do
        Recipe.find_by_tags("goof").should be_nil
      end
    end
    context "with multiple recipes in the database" do
      let!(:aaa){Recipe.new}
      let!(:bbb){Recipe.new}
      it "should return the recipe tagged goof" do
        aaa.update_attributes(:tags => "goof")
        Recipe.find_by_tags("goof").should == aaa
      end
    end
  end

  context ".destroy" do
    context "with multiple recipes in the database" do
      let!(:aaa){Recipe.new}
      let!(:bbb){Recipe.new}
      it "should delete the recipe named ciao" do
        aaa.update_attributes(:recipe_name => "ciao")
        Recipe.find_by_recipe_name("ciao").should == aaa
        aaa.destroy
        Recipe.find_by_recipe_name("ciao").should == nil
      end
    end

  end

end
