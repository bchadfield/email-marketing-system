class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.integer :industry_id
      t.string :company_name
      t.string :contact_name
      t.string :website
      t.string :email
      t.string :address
      t.string :reference_url

      t.timestamps
    end
    add_index :prospects, :industry_id
  end
end
