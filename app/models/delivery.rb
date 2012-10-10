class Delivery < ActiveRecord::Base
  attr_accessible :email_id, :prospect_id, :token
  
  belongs_to :email
end
