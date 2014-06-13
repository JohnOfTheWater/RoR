require 'spec_helper'

describe Comment do
  it { should belong_to :recipe }
  it { should belong_to :user }
  it { should validate_presence_of :comment }
  it { should validate_presence_of :recipe }
  it { should validate_presence_of :user }

  context ".find_by_id" do
    context "empty db" do
      it "should return nil" do
        Comment.find_by_id(1).should be_nil
      end
    end
  end
end
=begin
    context "with multiple comments in the database" do
      let!(:rec){Recipe.new}
      let!(:com){Comment.new}
      it "should return the comment from the recipe with id of 1" do
        rec.update_attributes(:id => 1)
        com.update_attributes(:recipe_id => 1)
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
=end
