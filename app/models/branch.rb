class Branch < ApplicationRecord
    belongs_to :hotel
    validates :manager_phone, length: { is: 10 }, numericality: { only_integer: true }
    validates :name, :location, :manager_name, :presence => true, format: { with: /[a-zA-Z]/ }
end
