require 'rails_helper'
  describe UsersController, :type => :controller do
    
    before do
      @user = User.create(email: "ahaschenburger@gmail.com", password: "12345678")
      @user2 = User.create(email: "amberbmulholland@gmail.com", password: "12345678")
    end
       
      context "No user is logged in" do
        it "redirects to login" do
          get :show, id: @user.id
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
          get :show, id: @user2.id
          expect(response).to redirect_to(root_path)
        end
      end
  end
    
end