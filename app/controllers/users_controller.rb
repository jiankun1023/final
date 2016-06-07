class UsersController < ApplicationController


  def show
     @user = User.find_by(id: params[:id])
     if !@user || (@user.id != session[:user_id].to_i)
       redirect_to root_url
     end
  end

  def edit
     @user = User.find_by(id: params[:id])
  end


  def update
    @user = User.find_by(id: params[:id])
    if @user.authenticate(params[:old_password])
      if params[:new_password] == params[:confirm_password]
        @user.password = params[:new_password]
        if @user.save
          redirect_to user_url, notice: 'Your password have been updated.'
          return
        else
          render 'edit'
          return
        end
      end
    else
      redirect_to "/users/change_password/#{@user.id}", notice: 'Wrong passowrd, please try again.'
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    redirect_to heroes_url
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_url
  end
end