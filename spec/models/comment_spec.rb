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
