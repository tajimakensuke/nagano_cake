class Order < ApplicationRecord
  
  belongs_to :customers
  has_many :order_details
end
