class Item < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  def to_param
<<<<<<< HEAD
    title.to_s.downcase.gsub(" ", "-")
=======
    title.to_s.parameterize
>>>>>>> 6445f4bcc7674234a17172c93e7afe2774045cc7
  end
end
