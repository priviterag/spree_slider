class Spree::Slide < ActiveRecord::Base
  has_attached_file :image
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position
end
