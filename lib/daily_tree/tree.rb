require 'pry'
require_relative '../daily_tree/tree_scraper.rb'

class Tree
  attr_accessor :scientific_name, :common_name, :comment, :stats, :height, :habit, :leaf, :form


  @@all = []
binding.pry
  def initialize(name, )
    Scraper.scrape_tree_index_page.each {|k,v| self.send("#{k}=",v)}

    @@all << self
  end


  Tree.new(Scraper.scrape_tree_index_page)



end
