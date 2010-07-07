# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
["Home", "About Us", "R.E.D. Training", "Consulting", "Contact Us"].each do |name|
  category = Category.find_or_create_by_title(name)

  page = Page.find_or_create_by_title("#{name} Page")
  page.category_id = category.id
  page.save!
end

["farst.6@osu.edu", "resolutelacrosse@gmail.com"].each do |user|
  unless User.find_by_email(user)
    User.create!(:email => user, :password => "buckeyes44", :password_confirmation => "buckeyes44")
  end
end
