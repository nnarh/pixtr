Rails.application.routes.draw do
  root to: "galleries#index"#renders 0.0.0.0:3000 to index page that lists galleries
  resource :session, only: [:new, :create]
  resources :users, only: [:new, :create]
  resources :galleries do #this will replace all routes below!!
    resources :images, only: [:new, :create, :show, :edit, :destroy] #all only new for what you actually need, not everything in images
      
  end 
end

 #get "/galleries" => "galleries#index"
  #get "/galleries/new" => "galleries#new"#new is the FORM! the Presentation
  #get "/galleries/:id" => "galleries#show", as: :gallery#index.html, as: :gallery allows the edit path to work
  #post "/galleries" => "galleries#create"#create SAVES it to the database. DIFFERENT FROM NEW
  #delete "/galleries/:id" => "galleries#destroy"
  #get "/galleries/:id/edit" => "galleries#edit"
  #patch "/galleries/:id" => "galleries#update"
