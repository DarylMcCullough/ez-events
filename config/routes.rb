Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root 'welcome#index'

end
