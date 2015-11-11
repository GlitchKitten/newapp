require 'rails_helper'

describe OrdersController, :type => :controller do
   before do
     @user = FactoryGirl.create(:user)
     @admin = FactoryGirl.create(:admin, id: "2")
     @order = FactoryGirl.create(:order)
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
        it "loads correct order details" do
          get :show, id: @user.id
          expect(response).to have_http_status(200) 
          expect(assigns(:order)).to eq @order
        end
      end
    end  
   
    describe "GET #show" do
      before do
        sign_in @admin
      end
      
      context "Admin is logged in" do
        it "shows user index" do
          get :index
            expect(response).to be_success
            expect(response).to have_http_status(200)
        end
      end
    end  
    
end