class User < ActiveRecord::Base

	 has_secure_password
  	 has_many :attentions
  	 has_many :heroes, :through => :attentions
end
