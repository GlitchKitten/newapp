class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}
  validates :stock, :numericality => {:greater_than_or_equal => 0}
  validates :name, presence: true
  
  def average_rating
    comments.average(:rating).to_f
  end
  
  def self.search(search)
    where("LOWER(name) LIKE ?", "%#{search}%")
  end   
  
  def number_of_shows
    $redis.incr("product-shows-#{id}").to_i
  rescue Exception => ex
    Rails.logger.error(ex.message)
    Rails.logger.error(ex.backtrace)
    0  
  end  
end
