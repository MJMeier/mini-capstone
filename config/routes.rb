Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api do
          get "/all_trudys_products" => "products#all_products_method"
          get "/sweet_trudys" => "products#sweet_trudys_method"
   end
end
