Rails.application.routes.draw do
  resources :contents do
    get 'preview' , on: :member

    #get 'contents/:id', to: 'contents#show', constraints:  { id: /\d.+/ }

    #get 'contents/*contentname' , to: 'contents#show' 

  end

  resources :contents 

  resources :courses
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root   to:'users#index'
  get "/static/:page" => "static#show"
  match "*path", to: "static#catch_404", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get '/contents/:contentname' => 'contents#show' , as: :contentshow


end
