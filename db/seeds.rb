# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
["Home", "About Us", "R.E.D. Training", "Consulting", "Contact Us"].each do |name|
  category = Category.find_or_create_by_title(name)

  page1 = Page.find_or_create_by_title("#{name} Page 1")
  page1.category_id = category.id
  page1.save!

  page2 = Page.find_or_create_by_title("#{name} Page 2")
  page2.category_id = category.id
  page2.save!
end

["farst.6@osu.edu"].each do |user|
  unless user.find_by_email(user)
    User.create!(:email => user, :password => "elgxsy", :password_confirmation => "elgxsy")
  end
end
