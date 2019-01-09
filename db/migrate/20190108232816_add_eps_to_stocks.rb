class AddEpsToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :eps, :decimal
  end
end
