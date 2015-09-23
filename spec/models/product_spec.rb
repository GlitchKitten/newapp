require 'rails_helper'
  describe Product do
    describe "#average_rating" do
      context "one or more ratings present" do
        before do
          @product = FactoryGirl.create(:product, :with_comment)
          @product = FactoryGirl.create(:product, :with_comment)
          @product = FactoryGirl.create(:product, :with_comment)
        end
        
        it 'returns the average rating of all comments' do
          expect(@product.average_rating).to eq 3
        end
      end  
    end
    
    context "product created without name" do
      before do
        @product = FactoryGirl.build(:product, name: "")
      end
      
      it 'product creation is not valid' do
        expect(@product).not_to be_valid
      end
    end  
  end  
            
        
        