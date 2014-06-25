require 'spec_helper'

describe Week do
  it { should have_many :days }

  describe 'week_date' do
    it { should allow_value('5-12-June').for(:week_date) }
    it { should allow_value('giova').for(:user) }
  end

  context ".find_by_id" do
    context "empty db" do
      it "should return nil" do
        Week.find_by_id(1).should be_nil
      end
    end

    context "with multiple weeks in the database" do
      let!(:aaa){Week.new}
      it "should return the week dated 5-12-June" do
        aaa.update_attributes(:week_date => "5-12-June")
        aaa.week_date.should == "5-12-June"
      end
      it "should return the default week user" do
        aaa.user.should == nil
      end
      it "should be from lollo" do
        y = Week.new
        y.update_attributes(:user => "lollo")
        y.user.should == "lollo"
      end
    end
  end

  context ".find_by_week_date" do
    context "empty db" do
      it "should return nil" do
        Week.find_by_week_date("yup").should be_nil
      end
    end
    context "with multiple weeks in the database" do
      let!(:aaa){Week.new}
      let!(:bbb){Week.new}
      it "should return the week dated 5-12-June" do
        aaa.update_attributes(:week_date => "5-12-June")
        Week.find_by_week_date("5-12-June").should == aaa
      end
      it "should return the week dated 13-20-June" do
        bbb.update_attributes(:week_date => "13-20-June")
        Week.find_by_week_date("13-20-June").should == bbb
      end
    end
  end

  context ".find_by_user" do
    context "empty db" do
      it "should return nil" do
        Week.find_by_user("ryu").should be_nil
      end
    end
    context "with multiple weeks in the database" do
      let!(:aaa){Week.new}
      let!(:bbb){Week.new}
      it "should return the week from user ryu" do
        aaa.update_attributes(:user => "ryu")
        Week.find_by_user("ryu").should == aaa
      end
      it "should return the week from user ken" do
        bbb.update_attributes(:user => "ken")
        Week.find_by_user("ken").should == bbb
      end
    end
  end

end
