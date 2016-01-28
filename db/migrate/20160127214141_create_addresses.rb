class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :state
      t.integer :zip
      t.string :contact_id
      t.string :address_type
      t.timestamps null: false
    end
  end
end
