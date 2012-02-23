Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :slides
  end
end
