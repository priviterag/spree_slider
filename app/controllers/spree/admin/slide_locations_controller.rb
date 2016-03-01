module Spree
  module Admin
    class SlideLocationsController < ResourceController
      respond_to :html

      def index
        @slide_locations = Spree::SlideLocation.order(:name)
      end
    end
  end
end
