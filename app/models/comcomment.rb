class Comcomment < ApplicationRecord
    belongs_to :user
    belongs_to :company

    paginates_per 10
end