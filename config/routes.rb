Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :staff 
  post "/staff/new", to:"staff#create"

end
Rails.application.routes.draw do
  resources :category
  post "/category/new", to:"category#create"
end

Rails.application.routes.draw do
  resources :service
  post "/service/new", to:"service#create"
end

Rails.application.routes.draw do
  root "order#index"
  resources :order
  post "/order/new", to:"order#create"
  get "/order/filter/:filter",to: "order#sorted"
  get "/ex",to:"order#exc"
end
Rails.application.routes.draw do
  resources :order_list
  post "/order_list/new", to:"order_list#create"
  
end