Rails.application.routes.draw do
  resources :registered_applications
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users
  
  root 'welcome#index'

end
