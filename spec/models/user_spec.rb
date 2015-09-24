require 'rails_helper'

  describe User do
  
    context "all user information present" do
      before do 
        @user = FactoryGirl.create(:user, email: "user@gmail.com") #overrides sequenced emails needed for comment trait creation
      end
      
      it "should return all information" do
        expect(@user.first_name).to eq "User"
        expect(@user.last_name).to eq "User"
        expect(@user.email).to eq "user@gmail.com"
        expect(@user.password).to eq "12345678"
      end
    end  
    
    context "user email is not provided" do
      before do
        @user = FactoryGirl.build(:user, email: "")
      end
   
      it "should not save the user" do
        expect(@user).not_to be_valid
      end
    end  
    
    context "user password is not provided" do
      before do
        @user = FactoryGirl.build(:user, password: "")
      end
   
      it "should not save the user" do
        expect(@user).not_to be_valid
      end
    end 
    
    context "user name is not provided" do
      before do
        @user = FactoryGirl.build(:user, first_name: "")
      end
   
      it "should not save the user" do
        expect(@user).not_to be_valid
      end
    end  
  end
 
