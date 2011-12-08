class Panel < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :panel,
                      :styles => { :normal => ["947x355#", :png] },
                      :storage => :s3_authenticated_url,
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'panel_pics',
                      :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
                      :s3_permissions => 'private',
                      :s3_protocol => 'https'

  else
    has_attached_file :panel,
                      :styles => { :normal => ["947x355#", :png] },
                      :storage => :filesystem
  end

  validates_presence_of :title, :if => :has_any_attributes?
  validates_presence_of :url, :if => :has_any_attributes?
  validates_presence_of :panel, :if => :has_any_attributes?
  validates_format_of :url, :with => /^[\w\/-]+$/i, :message => "was not in the proper format (must contain only letters, numbers, dashes, and forward slashes)", :if => :has_any_attributes?

  validates_attachment_presence :panel, :if => lambda {|a| a.panel? }

  validates_numericality_of :position

  scope :ordered_position, order("position ASC")

  POSITION = ["First", "Second", "Third", "Fourth"]

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
