Rails.application.routes.draw do
  root :to => 'planets#index'
  get '/planets' => 'planets#index'

  get '/planets/new' => 'planets#new'
  get '/planets/:id' => 'planets#show', :as => 'planet'

  post '/planets' => 'planets#create'
  post '/planets/:id/delete' => 'planets#destroy', :as => 'planet_delete'
  get '/planets/:id/edit' => 'planets#edit', :as => 'planet_edit'
  post '/planets/:id' => 'planets#update'
end
