class AddSizeToMenuItem < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :size, :string
  end
end
