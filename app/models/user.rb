class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :name
  validates_presence_of :name, :email

  acts_as_reader
  has_many :new_notifications

  has_many :home
  has_many :oncomments
  has_many :comcomments
  has_many :freecomments
  has_many :sharecomments
  has_many :reviewcomments

  enum status: ["개인", "업체"]
end


