class Service < ApplicationRecord
    validates :price, numericality: { greater_than: 0, allow_nil: true}
    has_many :order_lists
    validates :title, presence: true
end
