class ChangePublishedToTimestamp < ActiveRecord::Migration
  def up
    add_column :spree_slides, :published_at, :timestamp
    Spree::Slide.find_each do |slide|
      slide.update_columns(published_at: slide.created_at) if slide.published
    end
    remove_column :spree_slides, :published
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
