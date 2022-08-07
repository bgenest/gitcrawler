# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css(".Box-row")

sans_language_repo = []
js_repo_count = 0

repos = []
repo_list_items.each do |item|
  
  repo = item.css(".text-normal").text.strip 
  repo = {}
  repo[:name] = item.css(".text-normal").text.strip
  repo[:description] = item.css("p").text.strip
  repo[:language] = item.css(".ml-0").text.strip

  contributers = item.css("img")
  users = []
  contributers.each do |user|
      users << user['alt']
  end
  repo[:primary_contributers] = users

  repos << repo
end
repos.each do |repo|
  Post.create(name: repo[:name], description: repo[:description], language: repo[:language], primary_contributers: repo[:primary_contributers])
end



