class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable, :uncommon_password, :zxcvbnable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # def weak_words
  #   ['qwerty']
  # end
end
