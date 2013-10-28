Cross::Application.routes.draw do

  get  '/photos/upload' => 'photos#upload'
  post '/photos/upload/complete' => 'photos#client_upload_complete'
  post '/photos/attach/:page_id/:photo_id' => 'photos#attach'
  post '/photos/detach/:page_id/:photo_id' => 'photos#detach'
  get  '/photos/arrange/:slug' => 'photos#show_page_photos'
  post '/photos/arrange/:page_id' => 'photos#update_page_arrangment'
  get  '/photos/:id/force_iptc' => 'photos#force_iptc'
  resources :photos
  
  resources :pages

  get '*page' => 'pages#show_by_slug'

  root to: 'pages#show_index'

end
