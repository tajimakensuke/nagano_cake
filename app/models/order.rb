class Order < ApplicationRecord

  belongs_to :customer
  has_many :orders_details

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true

  accepts_nested_attributes_for :orders_details

  enum payment_method:{credit: 0, bank: 1}
  enum status:{waiting: 0, confirmation: 1, creating: 2, ready: 3, shipping: 4}


end
