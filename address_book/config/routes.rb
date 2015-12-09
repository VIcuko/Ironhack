Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts/new' => 'contacts#new'
  post 'contacts' => 'contacts#create'
end
