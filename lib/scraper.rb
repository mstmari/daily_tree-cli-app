require 'open-uri'
require 'pry'
require 'nokogiri'

# require_relative "daily_tree/version"
 require_relative  "./tree"
# require_relative "daily_tree/tree_scraper"
# require_relative  "daily_tree/cli"

class Scraper
@profile_url = ["https://plants.ces.ncsu.edu/plants/trees/asimina-triloba-sunflower/",
"https://plants.ces.ncsu.edu/plants/trees/asimina-triloba-sunflower/",
"https://plants.ces.ncsu.edu/plants/trees/asimina-triloba-susquehanna/",
"https://plants.ces.ncsu.edu/plants/trees/carya-illinoinensis-sumner/",
"https://plants.ces.ncsu.edu/plants/trees/morus-rubra-collier/"]

  @@all_trees = []
  @@all_tree_data = []

#this method scrapes the tree index page and creates a hash including the scientific_name and common_name
  def self.scrape_tree_index_page

    tree = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/"))
    tree_names = []
    #line 13 starts at table then locates the 'tr' tag and searches that for the data included in the 'td' tag
      tree.at('table').search('tr').each do |tr|
        tree_names << tr.search('td').map(&:text)
      end
      tree_names.compact!
      tree_names.map! do |a|
       tree = {scientific_name: a[0], common_name: a[1]}
      @@all_trees << Tree.new(tree)
      end
      tree_names
end
self.scrape_tree_index_page

# def self.profile_url_open(profile_url)
# profile_url.each do |url|
#   self.scrape_tree_data(url)
#   end
# end
# binding.pry
# self.profile_url_open(profile_url)
# create an array of URLS to scrape from
# iterate through and pass a URL to my scraper method
# test my scraper method through the CLI

#-------------


  def self.scrape_tree_data
    tree_data = {}

    @profile_url.each do |url|
      #binding.pry

    #This first part of the method scrapes the individual plant page.
    #***I need to figure out how to automatically access the page instead of hardcoding it in, like below.***
    doc = Nokogiri::HTML(open(url))
    new_array = doc.css(".plant_details").text.split("\n")

    #this part of the method parses the raw data found in '.plant_details' container.
    #There was some very weird spacing and set up, I first had to remove extra '"' and ',' and empty spaces that were originally
    #used to space out the data on the website.
    new_array.reject!{|a| a.nil? || (a.to_s.gsub(' ', '') == '') }
    #The next line splits the information at the ":" placing the 'key' and 'value' into different arrays so I can operate on and assign them.
    plant = new_array.map{|i| i.split(":")}

    #this next part iterates through the array of key and value and assigns the charecteristics I want, and ignores the ones I do not.
      plant.each do |i|
        key = i[0].gsub(" ","")
        value = i[1]

        if key == "Comment"
            tree_data[:comment] = value
        elsif key == "Height"
            tree_data[:height] = value
        elsif key == "Habit"
            tree_data[:habit] = value
        elsif key == "Leaf"
            tree_data[:leaf] = value
        elsif key == "Form"
            tree_data[:form] = value
          end
    end
    @@all_tree_data << tree_data
    #binding.pry
    @@all_trees[1].add_tree_attributes(@@all_tree_data)
  end
end
def self.all_tree_names
  @@all_trees
end

def self.all_tree_data
  @@all_tree_data
end

self.scrape_tree_data

def add_attributes_to_trees
  @@all_trees[1]
   self
  end

end
