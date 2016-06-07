Rails.application.routes.draw do
    root 'heroes#index'

    get '/login' => 'sessions#new'
  	post '/sessions' => 'sessions#create'
  	get '/logout' => 'sessions#destroy'

  	get '/signup' => 'users#new'
  	get '/users/change_password/:id' => 'users#edit'
  	patch '/users/change_password/:id' => 'users#update'
    resources :heroes
    resources :affiliations
    resources :users

    get '/attentions/:id/add' => 'heroes#pay_attention'
  	get '/attentions/:id/delete' => 'heroes#cancel_attention'
end
