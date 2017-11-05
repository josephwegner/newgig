Rails.application.routes.draw do
  root to: "inbox#home"

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  get 'inbox', to: 'inbox#home'
end
