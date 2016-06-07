class AttentionsController < ApplicationController

  before_action :require_user, :only => [:show, :edit, :update, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to book_url, notice: 'Please log in first.'
    else
      @user = User.find_by(id: session['user_id'])
    end
  end

end
