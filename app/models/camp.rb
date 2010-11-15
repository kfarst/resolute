class Camp < ActiveRecord::Base
  validate :format_of_address
  validates_presence_of :name,
                        :start_at,
                        :end_at,
                        :description,
                        :location,
                        :group,
                        :payment_url

  scope :high_school_camps, where(:group => "High School").order("start_at ASC")
  scope :junior_high_camps, where(:group => "Junior High").order("start_at ASC")
  scope :other_camps, where((:group ^ "High School") & (:group ^ "Junior High")).order("start_at ASC")

  private

  def format_of_address(record)
    results = Geocoding::get(record[:location])
    errors_based_on_count(results)
  end

  def errors_based_on_count(results)
    self.errors.add_to_base("location address returns no results. Please try again.") if results.count.zero? and return false
    self.errors.add_to_base("location address returns more than one results. Please refine your search.") if results.count > 1 and return false
    true
  end
end
