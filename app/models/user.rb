class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable, :trackable, :validatable, :omniauthable, :confirmable, :lockable

  has_many :posts
  has_many :comments

  def is_admin?
    ["jhider", "rstrong", "atrapp"].include? self.username
  end
end
