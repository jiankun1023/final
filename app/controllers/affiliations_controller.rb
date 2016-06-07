class AffiliationsController < ApplicationController


 



	def index
		@affiliations = Affiliations.all
	end

	def show
		@affiliations = Affiliations.find_by(id: params[:id])
	end

	def new
		
	end

	def create
		@affiliations = Affiliations.new
		@affiliations.tag = params[:tag]
		@affiliations.save
		redirect_to affiliations_url
	end

	def edit
		@affiliations = Affiliations.find_by(id: params[:id])
		@single = Affiliations.find_by(tag: "No Affiliations")
	end

	def update
		@hero = Hero.find_by(id: params[:hero_id])
		@hero.affiliations_id = params[:id]
		@hero.save
		redirect_to "/affiliations/#{@hero.affiliations_id}/edit"
	end

	def destroy
		hero = Hero.find_by(name: params[:id])
		affiliations = Affiliations.find_by(tag: "No Affiliations")
		hero.update(affiliations_id: affiliations.id)
		redirect_to affiliations_url
	end

end