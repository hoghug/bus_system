BusSystem::Application.routes.draw do
  root :to => 'application#index'
  resources :stations, :except => [:new, :edit]

  resources :lines, :except => [:new, :edit]
  resources :stops, :except => [:index, :show]

end
