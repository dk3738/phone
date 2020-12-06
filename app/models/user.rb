class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :email, :password, :status

  has_many :home
  has_many :comments
  has_many :comcomments
  has_many :freecomments
  has_many :sharecomments
  has_many :reviewcomments

  enum status: ["개인", "업체"]
end


