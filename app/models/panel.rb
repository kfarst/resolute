class Panel < ActiveRecord::Base
  if Rails.env.production?
    has_attached_file :picture,
                      :styles => { :small_panel => "620x528>", :large_panel => "306x212>" },
                      :storage => :s3,
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :path => ":attachment/:id/:style.:extension",
                      :bucket => 'panel_pics'
  else
    has_attached_file :picture,
                      :styles => { :small_panel => "620x528>", :large_panel => "306x212>" },
                      :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  end

  validates_presence_of :title, :if => :has_any_attributes?
  validates_presence_of :url, :if => :has_any_attributes?
  validates_presence_of :picture, :if => :has_any_attributes?

  def has_any_attributes?
    self.attributes.values.any?(&:present?)
  end

  def self.overwrite_existing(panels)
    panels.each do |panel|
      p = Panel.find_by_position(panel.position)
      p.destroy if (p.present? && panel.has_any_attributes?)
      panel.save! if panel.valid?
    end
  end
end
