Rails.application.routes.draw do
  resources :pages
  root to: "pages#root"
end
