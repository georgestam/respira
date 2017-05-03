Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  scope '(:locale)', locale: /en|ar|es/ do
  
    root to: 'pages#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :pages, only: %i[index create destroy]
    
    resources :articles, only: %i[index show]
    
    resources :stories, only: %i[index show]
  
  end

end
