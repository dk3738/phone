class Free < ApplicationRecord
  belongs_to :user
  has_many :freecomments, dependent: :destroy
  validates_presence_of :title, :description
  has_many_attached :images 

  paginates_per 15

  def thumbnail input
    return self.images[input].variant(resize: '800').processed
  end

end
