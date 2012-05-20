Dergi::Application.routes.draw do

  root :to => 'home#index'

  match "home" => "home#index"
  match "about" => "home#about"

  get  "admin" => "admin#index"
  get  "admin/login"
  get  "admin/logout"
  post "admin/sign_in"

  get  "admin/new_record"
  post "admin/new_record_save"
end
