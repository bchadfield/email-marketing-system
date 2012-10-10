class EmailVariable < ActiveRecord::Base
  attr_accessible :content, :email_id, :identifier
  
  belongs_to :email
end
