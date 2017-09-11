class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :password
      t.datetime :birth
      t.string :roleIds
      t.string :address

      t.timestamps
    end
  end
end
