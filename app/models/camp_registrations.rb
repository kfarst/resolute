class CampRegistrations < ActiveRecord::Base
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
  validates_presence_of :finding_resolute, :if => :find_resolute_in_form?

  validates_format_of :phone, :with => /^(\()?([0-9]{3})(\)|-|.\s)?([0-9]{3})(-)?([0-9]{4}|[0-9]{4})$/, :on => :create, :if => :phone_in_form?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :if => :email_in_form?
  validates_format_of :zip, :with => /^\d{5}([\-]\d{4})?$/, :if => :address_in_form?

  validates_numericality_of :age, :less_than => 100, :if => :age_in_form?
  validates_numericality_of :grade, :less_than => 13, :greater_than => 0, :if => :grade_in_form?
  validates_numericality_of :yrs_of_exp, :if => :yrs_of_exp_in_form?

  has_one :camp, :through => :registration_forms

  def to_param
    id
  end

  private

  def name_in_form?
    registration_form.name.true?
  end

  def email_in_form?
    registration_form.email.true?
  end

  def phone_in_form?
    registration_form.phone.true?
  end

  def age_in_form?
    registration_form.age.true?
  end
  
  def position_in_form?
    registration_form.position.true?
  end

  def school_in_form?
    registration_form.school.true?
  end

  def phone_in_form?
    registration_form.phone.true?
  end

  def address_in_form?
    registration_form.address.true?
  end

  def grade_in_form?
    registration_form.grade.true?
  end

  def yrs_of_exp_in_form?
    registration_form.yrs_of_exp.true?
  end

  def finding_resolute_in_form?
    registration_form.finding_resolute.true?
  end
end
