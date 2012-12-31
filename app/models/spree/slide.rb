class Spree::Slide < ActiveRecord::Base
  has_attached_file :image
  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image, :position, :product_id
  belongs_to :product

  def initialize(attrs = nil)
    attrs ||= {:published => true}
    super
  end

  def slide_name
    name.blank? && product.present? ? product.name : name
  end

  def slide_link
    link_url.blank? && product.present? ? product : link_url
  end

  def slide_image
    !image.file? && product.present? && product.images.any? ? product.images.first.attachment : image
  end
end
