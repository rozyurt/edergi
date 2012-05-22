Dergi::Application.routes.draw do

  get "home/article"

  get "user/new_paper"

  get "user/paper"

  get "home/new_member"

  root :to => 'home#index'

  match "home" => "home#index"
  match "about" => "home#about"
  match "contact" => "home#contact"
  match "article" => "home#article"

  get  "admin" => "admin#index"
  get  "admin/login"
  get  "admin/logout"
  post "admin/sign_in"

  get  "moderator" => "moderator#index"
  get  "moderator/login"
  get  "moderator/logout"
  post "moderator/sign_in"

  get  "user" => "user#index"
  get  "user/login"
  get  "user/logout"
  post "user/sign_in"

  get  "admin/new_record"
  post "admin/new_record_save"

  get  "user/new_paper"
  post "user/new_paper_save"

  get  "home/new_member"
  post "home/new_member_save"
end
