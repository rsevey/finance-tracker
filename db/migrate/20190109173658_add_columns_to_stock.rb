class AddColumnsToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :mcap, :decimal
    add_column :stocks, :pclose, :decimal
  end
end
