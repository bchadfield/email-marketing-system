class Prospect < ActiveRecord::Base
  attr_accessible :address, :company_name, :contact_name, :email, :industry_id, :reference_url, :website
  
  belongs_to :industry
end
