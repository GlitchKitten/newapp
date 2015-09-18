require 'rails_helper'
  describe Product do
    describe "#average_rating" do
      context "one or more ratings present" do
        before do
          @product = Product.create!(name: "shirt", price: "1", stock: "1")
          @user = User.create!(first_name: "Test", email: "Test@gmail.com", password: "12345678")
          @product.comments.create!(rating: 1, user: @user, body: "test")
          @product.comments.create!(rating: 3, user: @user, body: "test")
          @product.comments.create!(rating: 5, user: @user, body: "test")
        end
        
        it 'returns the average rating of all comments' do
          expect(@product.average_rating).to eq 3
        end
      end  
    end
    
    context "product created without name" do
      before do
        @product = Product.create(price: "1", stock: "1", description: "shirt")
      end
      
      it 'product creation is not valid' do
        expect(@product).not_to be_valid
      end
    end  
  end  
            
        
        