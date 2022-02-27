class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.integer :store_id,:null => false, index: { unique: false }
      t.string :code
      t.timestamps
    end
  end
end
