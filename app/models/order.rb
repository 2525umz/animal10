class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_details
   enum payment_method: { credit_card: 0, transfer: 1 }
   enum status: { status0: 0, status1: 1, status2: 2, status3: 3, status4: 4 }
end
