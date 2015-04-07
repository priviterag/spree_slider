class Spree::Slide < ActiveRecord::Base

  has_attached_file :image,
                    url: '/spree/slides/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  scope :published, -> { where(published: true).order('position ASC') }

  belongs_to :product, touch: true

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
