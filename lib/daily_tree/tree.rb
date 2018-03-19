require 'pry'
require_relative '../daily_tree/tree_scraper.rb'

class Tree
  attr_accessor :scientific_name, :common_name, :comment, :stats, :height, :habit, :leaf, :form


  @@all = []

  def initialize(scrape_tree_index_page, scrape_tree_data)
  # I want this to create a new instance of a tree, and assign the attributes and then add it to the @@all collection
    scrape_tree_index_page.each {|k,v| self.send("#{k}=",v)}


    @@all << self
  end




end
