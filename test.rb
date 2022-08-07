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

  repo = {
}

  repo[:name] = item.css(".text-normal").text.strip
  repo[:description] = item.css("p").text.strip
  repo[:language] = item.css(".ml-0").text.strip

  puts "Name: #{repo[:name]}"
  puts "------------------"
  puts "Description: #{repo[:description]}"
    if repo[:language] == ""
      puts "Primary Language: N/A"
       sans_language_repo << item.css(".text-normal").text.strip
    else
      if repo[:language] == "JavaScript"
        js_repo_count += 1 
      end
      puts "Primary Language: #{item.css(".ml-0").text.strip}"
    end

  contributers = item.css("img")
  users = []
  puts ("Top Contributers:")
  contributers.each do |user|
      puts user['alt']
      users << user['alt']
  end
  repo[:primary_contributers] = users
  puts ""
  repos << repo
end

repos
puts "More Info"
puts "-------------"
puts "JavaScript Repo Count:", js_repo_count
puts "Repos with no language:", sans_language_repo


#improvements make a class for this instead
