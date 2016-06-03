class HeroesController < ApplicationController
  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.find_by(id: params[:id])
    if @hero == nil
      redirect_to "http://localhost:3000"
    end
  end

  def create
    @newhero = Book.new
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
    redirect_to heroes_url
  end

end
