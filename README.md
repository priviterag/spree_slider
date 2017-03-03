# SpreeSlider

Add a slider to the homepage of your Spree site, and manage the slideshow from within the Admin panel.

## Installation

1. Add this extension to your Gemfile with this line:

  #### Spree >= 3.1

  ```ruby
  gem 'spree_slider', github: 'spree-contrib/spree_slider'
  ```

  #### Spree 3.0 and Spree 2.x

  ```ruby
  gem 'spree_slider', github: 'spree-contrib/spree_slider', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rake railties:install:migrations
  bundle exec rake db:migrate
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

### Using the slider

Spree 3 uses the bootstrap framework and a default slider template is available for bootstrap 3
`spree/shared/_slider.html.erb`.

Example usage:

```erb
  <%= render partial: 'spree/shared/slider', locals: { slider: Spree::Slide.published, cid: 'home', interval: false } %>
```

If you desire to have a customized carousel template you can specify your own like so:

```erb
<% if Spree::Slide.published.count > 0 %>
  <section id="slideshow">
    <ul class="slide">
      <% Spree::Slide.published.order('position ASC').each do |s| %>
        <li>
          <h1><%= s.slide_name %></h1>
          <%= link_to image_tag(s.slide_image.url), url_for(s.link_url) %>
        </li>
      <% end %>
    </ul>
    <a title="<%= t(:previous) %>" class="slider-prev"><%= t(:previous)%></a>
    <a title="<%= t(:next) %>" class="slider-next"><%= t(:next) %></a>
  </section>
<% end %>
```

## Dynamic content management

To add dynamic content, go to the spree admin section, under 'Configuration'
and find the Spree Slider & Spree Slider Locations menu.

You can create new slides and new locations. Then to fetch & render the slider for a particular location you can do the following:

```erb
  <% slides = Spree::Slide.published.location("home") %>
  <%= render partial: 'spree/shared/slider', locals: { slider: slides } %>
```

Copyright (c) 2012 [R.S.A.](http://www.rsaweb.com) released under the New BSD License
