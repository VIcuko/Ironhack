Rails.application.routes.draw do
  root to: 'site#home'
  get '/home' => 'site#home'
  get '/become_host' => 'site#become_host'
  get '/help' => 'site#help'
  get '/sign_up' => 'site#sign_up'
  get '/log_in' => 'site#log_in'
end