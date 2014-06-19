class Spree::Slide < ActiveRecord::Base

  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  scope :published, -> { where("published_at <= ?", Time.now).order('position ASC') }

  belongs_to :product, touch: true

  def initialize(attrs = nil)
    attrs ||= {:published_at => Time.now}
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
