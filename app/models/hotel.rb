class Hotel < ApplicationRecord
    belongs_to :user
    validates :name, :location, :presence => true
    validates :phone, length: { is: 10 }, numericality: { only_integer: true }
    validates :email, :presence => true, format:{with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is in invalid format"}
end
