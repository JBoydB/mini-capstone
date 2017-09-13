Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/images" => "images#index"
  get "/images/new" => "images#new"
  post "/images" => "images#create"
  get "/images/:id" => "images#show"
  get "/images/:id/edit" => "images#edit"
  patch "/images/:id" => "images#update"
  delete "/images/:id" => "images#destroy"
end
