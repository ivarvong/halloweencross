Cross::Application.routes.draw do

  get  '/photos/upload' => 'photos#upload'
  post '/photos/upload/complete' => 'photos#client_upload_complete'
  resources :photos
  
  resources :pages

  get '*page' => 'pages#show_by_slug'

  root to: 'pages#show_index'

end
