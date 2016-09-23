Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  devise_for :support_agents, :controllers => { :invitation => 'support_agents/invitations' }
  devise_for :customers, controllers: { sessions: 'customers/sessions' }
  devise_for :admins
  resources :support_agents
  resources :customers
  mount API::Root => '/'
  root to: 'cross#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
end
