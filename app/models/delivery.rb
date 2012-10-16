class Delivery < ActiveRecord::Base
  attr_accessible :email_id, :prospect_id, :token
  
  belongs_to :email
  belongs_to :prospect
  
  def self.search(search)
    if search
      joins(:email, :prospect).where('emails.name LIKE :search OR prospects.company_name LIKE :search', search: "%#{search}%")
    else
      scoped
    end
  end
  
  def compile_body
    self.variables.each{|key, value| self.email.body.gsub!(key, value)}
    self.email.body
  end
  
  def variables
    defaults = {"%%CONTACT_NAME%%" => self.prospect.contact_name, 
                "%%COMPANY_NAME%%" => self.prospect.company_name, 
                "%%INDUSTRY_NAME%%" => self.prospect.industry.name, 
                "%%COMPANY_WEBSITE%%" => self.prospect.website}
    self.email.email_variables.each do |ev|
      defaults["%%#{ev.identifier}"] = ev.content
    end
    defaults
  end
end