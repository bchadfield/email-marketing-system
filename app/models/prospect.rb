require 'csv'  

class Prospect < ActiveRecord::Base
  attr_accessible :address, :company_name, :contact_name, :email, :industry_id, :reference_url, :website
  
  belongs_to :industry
  has_many :deliveries
  
  def self.upload(file)
    count = 0
    CSV.parse(file.read, headers: true) do |row|
      row = row.to_hash
      if !row["email"].blank?
        row["industry_id"] = Industry.where(name: row["industry_id"]).first_or_create.id
        prospect = new(row)
        count += 1 if prospect.save
      end
    end
    count
  end
  
  def self.search(search)
    if search
      joins(:industry).where('company_name LIKE :search OR address LIKE :search OR industries.name LIKE :search', search: "%#{search}%")
    else
      scoped
    end
  end
end
