class AddStockTo < ActiveRecord::Migration
  def change
    add_column :products, :stock, :integer
  end
end
