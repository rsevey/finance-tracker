class AddChangeToStock < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :change, :decimal
  end
end
