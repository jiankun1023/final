class HeroesController < ApplicationController
  
  before_action :require_user, :only => [:create, :new, :edit, :update, :destroy, :pay_attention, :cancel_attention]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "Please log in."
    end
  end



  def index
    if params[:keyword].present?
      @heroes = Hero.where("name LIKE ?", "%#{params[:keyword]}%")
    else
      @heroes = Hero.all
    end
  end

  def show
    @hero = Hero.find_by(id: params[:id])
    if @hero == nil
      redirect_to heroes_url
    end
    session["hero_id"] = @hero.id

  end

  def new
    @newhero = Hero.new
    @movie = Movie.all
    @affiliations = Affiliations.all
    render "new"
  end

  def create
    @newhero = Hero.new
    @newhero.realname = params[:realname]
    @newhero.name = params[:name]
    @newhero.height = params[:height]
    @newhero.weight = params[:weight]
    @newhero.photo_url = params[:photo_url]
    @newhero.powers = params[:powers]
    @newhero.abilities = params[:abilities]
    @newhero.movie_id = params[:movie_id]
    @newhero.affiliations_id = params[:affiliations_id]
    @newhero.save
    redirect_to heroes_url, notice: "#{@newhero.name} added in the List."
  end

  def edit
    @hero=Hero.find_by(id: params[:id])
  end


  def update
    @hero = Hero.find_by(id: params[:id])
    @hero.name = params[:name]
    @hero.realname = params[:realname]
    @hero.height = params[:height]
    @hero.weight = params[:weight]
    @hero.photo_url = params[:photo_url]
    @hero.powers = params[:powers]
    @hero.abilities = params[:abilities]
    @hero.save
    redirect_to heroes_url
  end

  def destroy
    hero = Hero.find_by(id: params[:id])
    if hero
      hero.delete
    end
    redirect_to heroes_url
  end 

  def pay_attention
      if session[:user_id].blank?
        redirect_to root_url, notice: "Please log in."
        return
      end
     if Attention.find_by(hero_id: params[:id]).present? && Attention.find_by(user_id: session[:user_id]).present?
      redirect_to "/heores/#{params[:id]}", notice: "Already in Attention."
      return
    else
      favorite = Attention.new
      favorite.hero_id = params[:id]
      favorite.user_id = session[:user_id]
      favorite.save
      redirect_to "/heroes/#{params[:id]}", notice: "Go to 'Home' and check your heroes."
      return
    end
  end

  def cancel_attention
      if session[:user_id].blank?
        redirect_to root_url, notice: "Please log in."
        return
      end

      if Attention.find_by(hero_id: params[:id]).present?
         Attention.find_by(hero_id: params[:id]).delete
        redirect_to "/heroes/#{params[:id]}", notice: "Removed from Attention. Go to 'Home' to check your heroes."
        return
      else
        redirect_to "/heroes/#{params[:id]}", notice: "Already Removed."
        return
      end
  end

end
