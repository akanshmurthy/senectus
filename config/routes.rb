Rails.application.routes.draw do
  get 'home', to: 'static_pages#root'
  get 'drugs', to: 'static_pages#list'
  get 'drugdetail', to: 'static_pages#detail'
end
