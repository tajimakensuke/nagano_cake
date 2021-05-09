class OrdersDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status:{impossible: 0, waiting: 1, creating: 2, finish: 3}

end
