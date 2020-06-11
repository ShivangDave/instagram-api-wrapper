Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth', to: 'users#auth'
  get '/deauth', to: 'users#deauth'
  get '/pictures', to: 'users#pictures'
end
