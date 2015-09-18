require 'rails_helper'

  describe User do
  
    context "all user information present" do
      before do 
        @user = User.create(first_name: "Mary", last_name: "Smith", email: "marysmith@gmail.com", password: "12345678")
      end
      
      it "should return all information" do
        expect(@user.first_name).to eq "Mary"
        expect(@user.last_name).to eq "Smith"
        expect(@user.email).to eq "marysmith@gmail.com"
        expect(@user.password).to eq "12345678"
      end
    end  
    
    context "user email is not provided" do
      before do
        @user = User.create(first_name: "Mary", last_name: "Smith", password: "12345678")
      end
   
      it "should not save the user" do
        expect(@user).not_to be_valid
      end
    end  
    
    context "user password is not provided" do
      before do
        @user = User.create(first_name: "Mary", last_name: "Smith", email: "marysmith@gmail.com")
      end
   
      it "should not save the user" do
        expect(@user).not_to be_valid
      end
    end  
  end
 
