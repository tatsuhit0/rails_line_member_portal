class Members202202261449 < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :pin, :string
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :email, :string
    add_column :members, :tel1, :string
    add_column :members, :zip, :string
    add_column :members, :address1, :string
    add_column :members, :address2, :string
    add_column :members, :meta, :json
  end
end
