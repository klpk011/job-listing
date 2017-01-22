Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :jobs do
    member do
      get :search
    end
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      resources :resumes
      member do
        post :publish
        post :hide
      end
  ## root 'jobs#index'
    end
 end
end
