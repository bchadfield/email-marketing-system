class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :email_id
      t.string :prospect_id
      t.string :token

      t.timestamps
    end
    add_index :deliveries, [:email_id, :prospect_id]
  end
end
