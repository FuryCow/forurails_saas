Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :owner do
    post :authenticate, to: '/owners/authentication#authenticate'
    get :forums, to: '/owners/forums#forums_list'
  end
end
