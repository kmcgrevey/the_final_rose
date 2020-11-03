Rails.application.routes.draw do
  
  get '/bachelorettes/:id', to: 'bachelorettes#show'
  
  get '/bachelorettes/:bachelorette_id/contestants', to: 'contestants#index'
  
end
