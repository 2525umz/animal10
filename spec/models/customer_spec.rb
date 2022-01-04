require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "姓、名を登録すると、姓名が取得できること" do
    customer = Customer.new(
                last_name: "高橋",
                first_name: "花"
                )
  expect(customer.fill_name).to eq "髙橋 花"
  pending "add some examples to (or delete) #{__FILE__}"
end
end
