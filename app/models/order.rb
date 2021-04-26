class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details


  # enum payment_method:[:credit, :bank]


end
