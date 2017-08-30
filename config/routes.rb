Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/allproducts" => "products#all_products"
  get "/tv" => "products#tv"
  get "/console" => "products#console"
  get "/remote" => "products#remote"
  get "/paper" => "products#paper"
end
