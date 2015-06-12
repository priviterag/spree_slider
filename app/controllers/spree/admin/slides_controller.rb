module Spree
  module Admin
    class SlidesController < ResourceController
      respond_to :html

      def index
        @slides = Spree::Slide.order(:position)
      end

      private

      def slide_params
        params.require(:slide).permit(:name, :body, :link_url, :published, :image, :position, :product_id)
      end
    end
  end
end
