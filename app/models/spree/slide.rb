class Spree::Slide < ActiveRecord::Base

  has_attached_file :image
  include Spree::Core::S3Support
  supports_s3 :image

  scope :published, -> { where(published: true).order('position ASC') }

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
