class Spree::Admin::SlidesController < Spree::Admin::ResourceController
  respond_to :html

  def index
    @slides = Spree::Slide.all
  end

end
