BusSystem::Application.routes.draw do
  root :to => 'application#index'
  resources :stations, :except => [:new, :edit]
  resources :lines, :except => [:new, :edit] do
    resources :buses
  end
  resources :stops, :except => [:index, :show]
  resources :arrivals

end
