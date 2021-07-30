class Hotel < ApplicationRecord
    belongs_to :user
    has_many :branch
    validates :phone, length: { is: 10 }, numericality: { only_integer: true }
    validates :email, :presence => true, format:{with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is in invalid format"}
    paginates_per 100
end
