class Panel < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :panel,
                      :styles => { :small => "620x528#", :large => "306x212#" },
                      :storage => :s3,
                      :s3_credentials => "#{Rails.root}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'panel_pics'
  else
    has_attached_file :panel,
                      :styles => { :small => "620x528#", :large => "306x212#" },
                      :url => "/panels/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  end

  validates_presence_of :title, :if => :has_any_attributes?
  validates_presence_of :url, :if => :has_any_attributes?
  validates_presence_of :panel, :if => :has_any_attributes?
  validates_format_of :url, :with => /^([a-z0-9]+)+(-[a-z0-9]+)*$/i, :message => "must be in the format of 'sample-page'", :if => :has_any_attributes?
  validates_attachment_presence :panel, :if => lambda { self.panel? }

  def has_any_attributes?
    self.attributes.values.any?(&:present?)
  end

  def self.overwrite_existing(panels)
    panels.each do |panel|
      p = Panel.find_by_position(panel.position)
      if p.present?
        p.update_attributes(panel.attributes)
      else
        panel.save!
      end
    end
  end

  private

  def attachment_saved_in_database?
    errors.add_to_base("There was an error uploading the panel image. Please try again.") and return false if panel.nil?
  end

end
