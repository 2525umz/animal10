class AddItemIdToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :item_id, :integer
  end
end
