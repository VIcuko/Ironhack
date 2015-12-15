original_urls=["nintendo.es","koalastothemax.com/","beesbeesbees.com","haneke.net","cat-bounce.com","sadforjapan.com"]

original_urls.size.times do |time|
	Link.create(original_url: "#{original_urls[time]}", short_url: "#{time}")
end







# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
