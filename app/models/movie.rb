class Movie < ActiveRecord::Base
	has_many :heroes
	validates :title, :presence => true
end
