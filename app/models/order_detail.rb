class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { making0: 0, making1: 1, making2: 2, making3: 3}
end
