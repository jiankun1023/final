class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to root_url,notice: 'Welcome Back!'
      else
         redirect_to login_url, notice: 'Password Incorrect.'
      end
    else
        redirect_to login_url, notice: "Invalid email"
    end
  end

  def destroy
     if session[:user_id].present?
      session.delete(:user_id)
      redirect_to root_url, notice: 'Logout Successful.'
    else
      redirect_to root_url, notice: 'Logout Error.'
    end
  end

end