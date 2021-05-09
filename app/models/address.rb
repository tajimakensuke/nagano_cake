class Address < ApplicationRecord

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true


belongs_to :customer

  def view_name_and_id
    self.postal_code + ' ' + self.address + ' ' + self.name
  end

end