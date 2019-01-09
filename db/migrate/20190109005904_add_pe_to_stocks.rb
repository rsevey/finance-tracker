class AddPeToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :pe, :decimal
  end
end
