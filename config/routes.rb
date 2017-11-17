Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :update]
  end
  resources :doses, only: [:destroy]
  # because we don't need "Destroy dose path" to be nested --too complicated

  mount Attachinary::Engine => "/attachinary"

end
