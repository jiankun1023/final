class Affiliations < ActiveRecord::Base
	has_many :heroes
	validates :tag, :presence => true
end
