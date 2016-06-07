class Hero < ActiveRecord::Base
	belongs_to :movie
  	belongs_to :affiliations
  	has_many :attentions
  	has_many :users, :through => :attentions

  
  	validates :name, :presence => true, :uniqueness => true

end
