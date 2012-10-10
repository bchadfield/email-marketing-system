class CreateEmailVariables < ActiveRecord::Migration
  def change
    create_table :email_variables do |t|
      t.integer :email_id
      t.string :identifier
      t.text :content

      t.timestamps
    end
    add_index :email_variables, :email_id
  end
end
