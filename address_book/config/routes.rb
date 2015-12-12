Rails.application.routes.draw do
  root to: 'contacts#index'
  get 'contacts/new' => 'contacts#new'
  post 'contacts' => 'contacts#create'
  get 'contacts' => 'contacts#index'
  get 'contacts/favorite' => 'contacts#favorite'
  get 'contacts/:id' => 'contacts#show', as 'contacts'
  get 'contacts/:id/edit' => 'contacts#edit'
end
