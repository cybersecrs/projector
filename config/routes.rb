Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  resources  :projects

  root 'projects#index'

end
