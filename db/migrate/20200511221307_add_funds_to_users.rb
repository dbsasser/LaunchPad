class AddFundsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :funds, :integer, default: 1000
  end
end
