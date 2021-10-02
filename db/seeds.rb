# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
thisweek = Week.create! :weeknum => (Date.today.cweek + 1)
thisweek.save!
user = User.create! :name => 'Administrator 1', :email => 'admin1@testemail.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'admin', :company => 'admin', :approval_group => 1
user.save!
user = User.create! :name => 'Administrator 2', :email => 'admin2@testemail.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'admin', :company => 'admin', :approval_group => 2
user.save!
user = User.create! :name => 'Administrator 3', :email => 'admin3@testemail.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'admin', :company => 'admin', :approval_group => 3
user.save!
user = User.create! :name => 'Administrator 4', :email => 'admin4@testemail.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'admin', :company => 'admin', :approval_group => 4
user.save!
user = User.create! :name => 'Travis Johnson', :email => 'JohnsonT@samtrans.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'superadmin', :company => 'admin', :approval_group => 4
user.save!
user = User.create! :name => 'Inspector', :email => 'inspector@testemail.com', :password => 'password', :password_confirmation => 'password', :phone => '5555555555', :role => 'inspector', :company => 'admin', :approval_group => 4
user.save!

5.times do
  FactoryBot.create(:user)
end

50.times do
   FactoryBot.create(:request, week: thisweek)
end
