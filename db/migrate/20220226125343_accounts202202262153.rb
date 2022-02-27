class Accounts202202262153 < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :store_id
  end
end
