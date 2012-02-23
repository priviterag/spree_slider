class CreateSlides < ActiveRecord::Migration
  def change
    create_table :spree_slides do |t|
      t.string :name
      t.text :body
      t.string :link_url
      t.boolean :published
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
