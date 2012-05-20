DnDoR::Application.routes.draw do
  get "combat/initiative", as: 'initiative'

  resources :encounters
  resources :characters, :only => [:index, :destroy]
  resources :non_player_characters, :except => [:index, :destroy]
  resources :insider_data do
    get :fetch, on: :collection
  end

  root to: 'characters#index'
end
