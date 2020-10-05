class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.integer     :postnumber,      null: false
      t.integer     :status,          null: false
      t.string      :city,            null: false
      t.integer     :housenumber,     null: false
      t.string      :housename,       null: false
      t.string      :phonenumber,     null: false
      t.references  :order,           null: false,foreign_key: true

      t.timestamps
    end
  end
end
