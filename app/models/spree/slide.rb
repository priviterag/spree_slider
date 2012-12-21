class Spree::Slide < ActiveRecord::Base
  has_attached_file :image
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position, :product_id
  belongs_to :product

  def slide_name
    name.blank? && product.present? ? product.name : name
  end

  def slide_link
    link_url.blank? && product.present? ? product : link_url
  end
end
