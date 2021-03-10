Rails.application.routes.draw do
  resources :orders do
    collection do
      get 'pull'
    end
  end
  resources :products
end
