require 'rails_helper'
  describe UsersController, :type => :controller do
    
    before do
      @user = FactoryGirl.create(:user, id: "1")
      @admin = FactoryGirl.create(:admin, id: "2")
    end
       
      context "No user is logged in" do
        it "redirects to login" do
          get :index
          expect(response).to redirect_to(user_session_path)
        end
      end
    
    describe "GET #show" do
      before do
        sign_in @user
      end
      
      context "User is logged in" do 
        it "loads correct user details" do
          get :show, id: @user.id
          expect(response).to have_http_status(200) 
          expect(assigns(:user)).to eq @user
        end
      end
      
      context "User attempts to view other's info" do
        it "redirects to home page" do
          get :show, id: @admin.id
          expect(response).to redirect_to(root_path)
        end
      end
  end
    
end