Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'users#welcome'
  get '/auth', to: 'users#auth'
  get '/deauth', to: 'users#deauth'
  get '/pictures', to: 'users#pictures'
  get '/refresh', to: 'users#refresh'
end
