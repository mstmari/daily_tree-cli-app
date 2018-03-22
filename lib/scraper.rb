require 'open-uri'
require 'pry'
require 'nokogiri'
require_relative  "./tree"


class Scraper

  @@all_urls = []

  @@all_trees = []
  @@all_tree_data = []

  #this method scrapes the tree index page and creates a hash including the scientific_name and common_name
  def self.scrape_tree_index_page

    tree = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/"))
    @tree_names = []
    #line 13 starts at table then locates the 'tr' tag and searches that for the data included in the 'td' tag
    tree.at('table').search('tr').each do |tr|
      @tree_names << tr.search('td').map(&:text)
    end
    #this next section removes the nil values then assigns the names to their values
    #then creates and names all the trees
    @tree_names.compact!
    @tree_names.map! do |a|
      tree = {scientific_name: a[0], common_name: a[1]}
      @@all_trees << Tree.new(tree)
      #binding.pry
    end
    @tree_names

  end
  self.scrape_tree_index_page
  #-------------
  #This method scrapes the index page and retireves the URL's to pass into to the profile page scraper method.

  def self.scrape_url

    doc = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/"))
    urls = doc.css('.th-sci-name  a').map { |link| link['href'] }
    @@all_urls = urls.collect do |url|
      "https://plants.ces.ncsu.edu#{url}"
    end
    @@all_urls
    #binding.pry
  end
  self.scrape_url

  #-------------


  def self.scrape_tree_data
    #self.scrape_url
    tree_data = {}

    #@@all_urls.each do |url|

    @@all_urls.each.with_index do |url, idx|
      #This first part of the method scrapes the individual plant page.
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
      @@all_trees[1].add_tree_attributes(@@all_tree_data)
      #binding.pry
      @@all_trees[idx].add_tree_attributes(@@all_tree_data)
    end
  end


  self.scrape_tree_data


end
