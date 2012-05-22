# encoding: utf-8

class ModeratorController < ApplicationController

  before_filter :require_moderator, :except => [:login, :sign_in]

  def require_moderator
    redirect_to '/moderator/login' unless session[:moderator]
  end

  def index

  end

  def login
    redirect_to '/moderator' if session[:moderator]
  end

  def sign_in
    moderator = Moderator.first(:conditions => { :email => params[:email], :password => params[:password] })
    if moderator
      session[:moderator] = moderator[:id]
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanıcı adı veya parola hatalı! Lütfen tekrar deneyiniz"
    end
    redirect_to '/moderator/login'
  end

  def logout
    reset_session
    redirect_to '/moderator/login'
  end


end
