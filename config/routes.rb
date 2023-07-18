Rails.application.routes.draw do
 #get 'home/zipcode'
 root 'home#index'


get "/zipcode" => 'home#zipcode', as: 'zipcode'
post "/zipcode" => 'home#zipcode'
 #post "/home/zipcode" => 'home/zipcode'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
