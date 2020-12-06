class Review < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :description
  has_many :reviewcomments, dependent: :destroy
  has_many_attached :images 

  paginates_per 12

  def thumbnail input
    return self.images[input].variant(resize: '800').processed
  end
end
