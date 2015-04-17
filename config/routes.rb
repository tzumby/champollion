Champollion::Engine.routes.draw do
  resources :templates

  root 'templates#index'
end
