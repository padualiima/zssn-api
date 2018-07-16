Rails.application.routes.draw do

  resources :inventories
  resources :survivors
  resources :reports, only:[:index, :create]

 # Routes for API report delivery
  get '/reports/infected', to: "reports#infected"
  get '/reports/no_infected', to: "reports#no_infected"

end
