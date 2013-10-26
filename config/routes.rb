Cross::Application.routes.draw do

  resources :photos
  get '/photos/upload' => 'photos#upload'
  get '/photos/upload/complete' => 'photos#upload_complete'

  resources :pages

  get '*page' => 'pages#show_by_slug'

  root to: 'pages#show_index'

end
