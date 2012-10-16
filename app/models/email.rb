class Email < ActiveRecord::Base
  attr_accessible :body, :description, :name, :subject, :email_variables_attributes
  
  has_many :email_variables
  has_many :deliveries
  
  accepts_nested_attributes_for :email_variables, :allow_destroy => true, :reject_if => proc { |attributes| attributes['identifier'].blank? }

end
