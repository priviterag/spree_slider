Deface::Override.new(:virtual_path => 'spree/admin/shared/_configuration_menu',
                     :name => 'add_slides_to_admin_configurations_sidebar_menu',
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
                     :text => %q{
                        <%= configurations_sidebar_menu_item 'Spree Slider', admin_slides_path %>
                     })

