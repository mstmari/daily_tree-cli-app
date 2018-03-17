require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  binding.pry

def self.scrape_tree_index_page
  tree = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/"))
  scraped_tree_names = []

    tree.css("#plant-table-div").each do |i|
      tree_names = {common_name: i.css(".td-comm-name").text,
       scientific_name: i.css(".th-sci-name a").text}
      scraped_tree_names.push(tree_names)
    end
    scraped_tree_names
  end
  tree.css(".td-comm-name a").text each do |i|

end







end
