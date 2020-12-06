class Company < ApplicationRecord
  belongs_to :user
  has_many :comcomments, dependent: :destroy
  validates_presence_of :title, :description
  has_many_attached :images

  paginates_per 12

  def thumbnail input
    return self.images[input].variant(resize: '800').processed
  end

end
