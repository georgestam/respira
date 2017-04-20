Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  scope '(:locale)', locale: /en|ea|es/ do
  
    root to: 'pages#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :pages, only:[:index, :create, :destroy]
    
    resources :articles, only:[:index, :show]
    
    resources :stories, only:[:index, :show]
  
  end

end
