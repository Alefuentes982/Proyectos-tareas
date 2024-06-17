Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks
  end

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
end
