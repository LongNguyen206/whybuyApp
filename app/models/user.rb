class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable, :uncommon_password, :zxcvbnable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
 
  #deleting a user will delete the associated profile
  has_one :profile, validate: true, dependent: :destroy, inverse_of: :user

end
