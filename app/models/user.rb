class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable, :trackable, :validatable, :omniauthable, :confirmable, :lockable

  validates_presence_of :username, on: :create
  validates_uniqueness_of :username
  
  has_many :posts
  has_many :comments

  def is_admin?
    ["jhider", "rstrong", "atrapp"].include? self.username
  end
end
