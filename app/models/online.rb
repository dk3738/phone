class Online < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :description
  has_many_attached :images 

  paginates_per 10

  def thumbnail input
    return self.images[input].variant(resize: '100%').processed
  end

end
