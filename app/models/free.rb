class Free < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :description
  has_many_attached :images 

  acts_as_commentable
  
  paginates_per 15

  def thumbnail input
    return self.images[input].variant(resize: '800').processed
  end

end
