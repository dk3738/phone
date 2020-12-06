class Share < ApplicationRecord
  belongs_to :user
  has_many :sharecomments, dependent: :destroy
  validates_presence_of :title, :description
  has_many_attached :images

  paginates_per 15

  def thumbnail input
    return self.images[input].variant(resize: '100%').processed
  end

end
