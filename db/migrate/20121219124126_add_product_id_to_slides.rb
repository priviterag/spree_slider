class AddProductIdToSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :product_id, :integer
  end
end
