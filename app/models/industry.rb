class Industry < ActiveRecord::Base
  attr_accessible :name, :practitioners
  
  has_many :prospects
end
