# encoding: utf-8

class HomeController < ApplicationController
  def contact
  end

  def new_member

  end

  def new_member_save
    user = User.new({ :first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password] })
    if user.save
      flash[:notice] = "Kayıt Yapıldı"
      # session[:admin] = user[:id]
    else
      flash[:error] = "Kayıt Yapılamadı"
    end
    redirect_to '/user/login'
  end



end
