class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates :stock, :numericality => {:greater_than_or_equal => 0}
  
  def average_rating
    comments.average(:rating).to_f
  end
end
