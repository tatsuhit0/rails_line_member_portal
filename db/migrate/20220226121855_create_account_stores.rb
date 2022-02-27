class CreateAccountStores < ActiveRecord::Migration[6.1]
  def change
    create_table :account_stores do |t|
      t.references :account, index: true, foreign_key: true
      t.references :store, index: true, foreign_key: true

      t.timestamps
    end
  end
end
