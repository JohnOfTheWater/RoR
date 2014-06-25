require 'spec_helper'

describe Day do
  it { should belong_to :week }

  describe 'day' do
    it { should allow_value('monday').for(:day) }
    it { should allow_value('banana').for(:recipe_name) }
  end

  context ".find_by_id" do
    context "empty db" do
      it "should return nil" do
        Day.find_by_id(1).should be_nil
      end
    end

    context "with multiple days in the database" do
      let!(:aaa){Day.new}
      it "should return the day monday" do
        aaa.update_attributes(:day => "monday")
        aaa.day.should == "monday"
      end
      it "should return the default image" do
        aaa.recipe_name.should == nil
      end
      it "should have description bla bla bla" do
        y = Day.new
        y.update_attributes(:description => "bla bla bla")
        y.description.should == "bla bla bla"
      end
    end
  end

  context ".find_by_day" do
    context "empty db" do
      it "should return nil" do
        Day.find_by_day("yup").should be_nil
      end
    end
    context "with multiple weeks in the database" do
      let!(:aaa){Day.new}
      let!(:bbb){Day.new}
      it "should return the day monday" do
        aaa.update_attributes(:day => "monday")
        Day.find_by_day("monday").should == aaa
      end
      it "should return the day tuesday" do
        bbb.update_attributes(:day => "tuesday")
        Day.find_by_day("tuesday").should == bbb
      end
    end
  end

  context ".find_by_recipe_name" do
    context "empty db" do
      it "should return nil" do
        Day.find_by_recipe_name("ryu").should be_nil
      end
    end
    context "with multiple weeks in the database" do
      let!(:aaa){Day.new}
      let!(:bbb){Day.new}
      it "should return the day from user ryu" do
        aaa.update_attributes(:recipe_name => "banana")
        Day.find_by_recipe_name("banana").should == aaa
      end
      it "should return the week from user ken" do
        bbb.update_attributes(:recipe_name => "ken")
        Day.find_by_recipe_name("ken").should == bbb
      end
    end
  end

end
