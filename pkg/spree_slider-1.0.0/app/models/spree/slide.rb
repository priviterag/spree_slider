class Spree::Slide < ActiveRecord::Base
  has_attached_file :image
  scope :published, where(:published => true)
end
