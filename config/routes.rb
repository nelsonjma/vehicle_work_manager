Rails.application.routes.draw do

  root :to => 'vehicles#index'

  resources :session,             :only => [:create]
  get '/login'  => 'session#new',      :as => 'login'
  get '/logout' => 'session#destroy',  :as => 'logout'

  resources :vehicles,              :only => [:index, :edit, :create, :update, :destroy]

  resources :vehicle_types,         :only => [:index, :new, :edit, :create, :update, :destroy]

  resources :works,                 :only => [:index, :edit, :create, :update, :destroy]

  resources :tasks,                 :only => [:index, :new, :edit, :create, :update, :destroy]

  resources :stock_items,           :only => [:index, :new, :edit, :create, :update, :destroy]

  resources :work_tasks,            :only => [:index, :new, :edit, :create, :update, :destroy]

  resources :task_items,            :only => [:index, :new, :edit, :create, :update, :destroy]

  resources :stock_item_selectors,  :only => [:index]

end
