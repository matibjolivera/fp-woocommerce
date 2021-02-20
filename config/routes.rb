Rails.application.routes.draw do
  resources :orders do
    collection do
      get 'save'
    end
  end
  resources :products
end
