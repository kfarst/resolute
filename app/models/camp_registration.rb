class CampRegistration < ActiveRecord::Base
  validates_presence_of :name, :if => :name_in_form?
  validates_presence_of :email, :if => :email_in_form?
  validates_presence_of :age, :if => :age_in_form?
  validates_presence_of :position, :if => :position_in_form?
  validates_presence_of :school, :if => :school_in_form?
  validates_presence_of :phone, :if => :phone_in_form?
  validates_presence_of :street_address, :if => :address_in_form?
  validates_presence_of :city, :if => :address_in_form?
  validates_presence_of :state, :if => :address_in_form?
  validates_presence_of :zip, :if => :address_in_form?
  validates_presence_of :grade, :if => :grade_in_form?
  validates_presence_of :yrs_of_exp, :if => :yrs_of_exp_in_form?
  validates_presence_of :finding_resolute, :if => :finding_resolute_in_form?
  validates_presence_of :registration_form_id
  validates_presence_of :shirt_size, :if => :shirt_size_in_form?
  validates_presence_of :gender, :if =>  :gender_in_form?

  validates_format_of :phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create, :if => :phone_in_form?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :if => :email_in_form?
  validates_format_of :zip, :with => /^\d{5}([\-]\d{4})?$/, :if => :address_in_form?

  validates_numericality_of :age, :less_than => 100, :if => :age_in_form?
  validates_numericality_of :grade, :less_than => 13, :greater_than => 0, :if => :grade_in_form?
  validates_numericality_of :yrs_of_exp, :if => :yrs_of_exp_in_form?

  has_one :camp, :through => :registration_form
  has_one :registration_form

  def to_param
    id
  end

  def registration_form
    @form ||= RegistrationForm.find_by_id(registration_form_id)
  end

  def self.format_for_save(object)
    return object if object[:position].nil?

    pos_string = ""
    object[:position].each_pair do |key, value| 
      pos_string << "#{value}, "
      object[:position].delete(key)
    end
    object.merge({:position => pos_string})
  end
  
  private

  def method_missing(symbol, &block)
    if symbol.to_s =~ /(.+)_in_form\?/
      method_bool = $1 + "?"
      registration_form.send(method_bool, &block)
    else
      super
    end
  end

end
