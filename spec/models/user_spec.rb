require 'rails_helper'

  describe User do
  
    context "first name present" do
      before :each do 
        @user = User.new(first_name: "Mary", last_name: "Smith")
      end
      it "should return first name" do
        expect(@user.first_name).to eq "Mary"
      end
    end
  end
