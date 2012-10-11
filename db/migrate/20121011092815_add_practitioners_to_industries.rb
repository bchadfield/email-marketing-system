class AddPractitionersToIndustries < ActiveRecord::Migration
  def change
    add_column :industries, :practitioners, :string
  end
end
