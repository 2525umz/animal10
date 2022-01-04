class RemoveIsActiveFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :is_active, :items
  end
end
