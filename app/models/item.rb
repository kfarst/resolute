class Item < ActiveRecord::Base
  def to_param
    title.to_s.parameterize
  end
end
