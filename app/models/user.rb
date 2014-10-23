class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable,
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :omniauthable#, :validatable, :confirmable, :lockable

  has_many :posts
end
