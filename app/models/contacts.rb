class Contacts
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming  

  attr_accessor :first_name, :last_name, :email, :message

  validates_presence_of :first_name, :last_name, :email, :message
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
  validates_length_of :message, :maximum => 500  

  def initialize(attributes = nil)  
    attributes ||= {}
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end  
     
  def persisted?  
    false  
  end  
end
