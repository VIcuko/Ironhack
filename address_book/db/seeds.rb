
20.times do |time|
	Contact.create(name:"James#{time}" ,address:"James Street number #{time}" ,phone:"61909744#{time}" ,email:"crazymail#{time}@mymail.com")
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
