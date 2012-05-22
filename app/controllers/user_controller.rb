# encoding: utf-8

class UserController < ApplicationController

  before_filter :require_user, :except => [:login, :sign_in]

  def require_user
    redirect_to '/user/login' unless session[:user]
  end

  def index

  end

  def login
    redirect_to '/user' if session[:user]
  end

  def sign_in
    user = User.first(:conditions => { :email => params[:email], :password => params[:password] })
    if user
      session[:user] = user[:id]
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanıcı adı veya parola hatalı! Lütfen tekrar deneyiniz"
    end
    redirect_to '/user/login'
  end

  def logout
    reset_session
    redirect_to '/user/login'
  end



  def new_paper

  end

  def new_paper_save
    article = Article.new({ :article_name => params[:article_name], :article_content => params[:article_content] })
    if article.save
      flash[:notice] = "Kayıt Yapıldı"
      # session[:admin] = user[:id]
    else
      flash[:error] = "Kayıt Yapılamadı"
    end
    redirect_to '/user/new_paper'
  end

end
