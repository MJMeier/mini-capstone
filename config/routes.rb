Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    post "/orders" => "orders#create"

    get "/orders" => "orders#index"

    post "/carted_products" => "carted_products#create"

    get "/carted_products" => "carted_products#index"
  end

  get "/products" => "products#index"
  get "/products/new" => "products#new"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

end
