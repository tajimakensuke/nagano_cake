class Address < ApplicationRecord


belongs_to :customer

  def view_name_and_id
    self.postal_code + ' ' + self.address + ' ' + self.name
  end

end