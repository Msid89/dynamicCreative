Rails.application.routes.draw do

  resources :categories do
  	collection { post :import}
  end

  resources :products   

  get '/start' => 'categories#index'

  root 'categories#index'   
 
end
