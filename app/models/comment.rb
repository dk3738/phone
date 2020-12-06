class Comment < ApplicationRecord
  belongs_to :online
  belongs_to :user
end
