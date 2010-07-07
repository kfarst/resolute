class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :recoverable, :rememberable#, :validatable, :confirmable
  #, :registerable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
