Rails.application.routes.draw do
  resources :projects do
    member do
      put :toggle_complete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#index'
end
