require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  #binding.pry

# def self.scrape_tree_index_page
#   tree = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/"))
#   scraped_tree_names = []
#
#     tree.css("#plant-table-div").each do |i|
#       tree_names = {common_name: i.css(".td-comm-name").text,
#        scientific_name: i.css(".th-sci-name a").text}
#       scraped_tree_names.push(tree_names)
#     end
#     scraped_tree_names
#   end


binding.pry
  def self.scrape_tree_data
    tree_data = {}
    doc = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/trees/asimina-triloba-sunflower/"))
    doc.css(".plant_details").each do |i|
       i.attributes[".key"]
      case
      when i.include?("Comment:")
            tree_data[:comment] = i
        when i.include?("Height:")
            tree_data[:height] = i
        when i.include?("Habit:")
            tree_data[:habit] = i
        when i.include?("Leaf:")
            tree_data[:leaf] = i
        when i.include?("Form:")
            tree_data[:form] = i
      end
    end
    tree_data_hash
  end
# doc.css(".key").select {|i|







end
