module SpreeSlider
  class InstallNivoGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)    
    def install
      #copy slider partial
      copy_file "nivo_slider.html.erb", "app/views/spree/shared/_slider.html.erb"      
      
      #add javascripts
      append_file "vendor/assets/stylesheets/spree/frontend/all.js", "//= require jquery.nivo.slider.pack.js\n" 

      #add stylesheets
      inject_into_file "vendor/assets/javascripts/spree/frontend/all.css", " *= require themes/default/default\n", :before => /\*\//, :verbose => true
      inject_into_file "vendor/assets/javascripts/spree/frontend/all.css", " *= require themes/pascal/pascal\n", :before => /\*\//, :verbose => true
      inject_into_file "vendor/assets/javascripts/spree/frontend/all.css", " *= require themes/orman/orman\n", :before => /\*\//, :verbose => true
      inject_into_file "vendor/assets/javascripts/spree/frontend/all.css", " *= require nivo-slider\n", :before => /\*\//, :verbose => true

      #copy migrations
      run 'bundle exec rake railties:install:migrations FROM=spree_slider' 

      #run migrations
      res = ask "Would you like to run the migrations now? [Y/n]"
      if res == "" || res.downcase == "y"
        run 'bundle exec rake db:migrate'
      else
        puts "Skiping rake db:migrate, don't forget to run it!"
      end

    end
  end
end




