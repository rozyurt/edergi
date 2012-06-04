# encoding: utf-8

class AdminController < ApplicationController

  before_filter :require_admin, :except => [:login, :sign_in]

  def require_admin
    redirect_to '/admin/login' unless session[:admin]
  end

  def index

  end

  def login
    redirect_to '/admin' if session[:admin]
  end

  def sign_in
    admin = Admin.first(:conditions => { :email => params[:email], :password => params[:password] })
    if admin
      session[:admin] = admin[:id]
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanıcı adı veya parola hatalı! Lütfen tekrar deneyiniz"
    end
    redirect_to '/admin/login'
  end

  def logout
    reset_session
    redirect_to '/admin/login'
  end

  def new_record

  end

  def new_record_save
    user = User.new({ :first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password] })
    if user.save
      flash[:notice] = "Kayıt Yapıldı"
      session[:admin] = user[:id]
    else
      flash[:error] = "Kayıt Yapılamadı"
    end
    redirect_to '/admin/new_record'
  end

  def profile
    @pagetitle = "Kişisel Bilgiler"
  end

  def profile_save
    admin = Admin.update(session[:admin][:id], {
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :password => params[:password],
    })

    if admin.save
      session[:admininfo] = admin
      flash[:notice] = "Bilgileriniz Güncellenmiştir."
    else
      flash[:error] = "Bilgileriniz Güncellenemedi."
    end
    redirect_to '/admin/profile'
  end

end
