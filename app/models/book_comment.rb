class BookComment < ApplicationRecord
    validates :comment, presence: true

    belongs_to :user
    belongs_to :book

    validates :comment, presence: true


end
