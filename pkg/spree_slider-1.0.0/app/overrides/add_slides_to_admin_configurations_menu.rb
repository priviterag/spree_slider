Deface::Override.new(:virtual_path => 'spree/admin/configurations/index',
                     :name => 'add_slides_to_admin_configurations_menu',
                     :insert_bottom => "[data-hook='admin_configurations_menu']",
                     :text => %q{
                        <tr>
                          <td><%= link_to 'Spree Slider', admin_slides_path %></td>
                          <td>Manage Spree Slider contents</td>
                        </tr> })

