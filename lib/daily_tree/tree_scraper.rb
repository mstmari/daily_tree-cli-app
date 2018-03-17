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
    doc.css(".key").each do |i|
      #puts i.attributes[".key"]
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
    tree_data
  end
# doc.css(".key").select {|i|

#     def self.scrape_profile_page(profile_url)
#         student = {}
#
#         doc = Nokogiri::HTML(open(profile_url))
#         doc.css(".social-icon-container a").each do |link|
#           url = link.attributes["href"].value
#
#           case
#             when i.include?("Comment")
#                 tree_data[:comment] = i
#             when url.include?("Height")
#                 tree_data[:height] = i
#             when url.include?("Habit")
#                 tree_data[:habit] = i
#              when url.include?("Habit")
#                 tree_data[:habit] = i
#             when url.include?("Form")
#                 tree_data[:form] = i
#           end
#
#
#                 student [:profile_quote] = doc.css(".profile-quote").text
#                 student [:bio] = doc.search(".description-holder p").text
#
#
#
#   end
#   student
# end





end
