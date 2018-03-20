require 'pry'
# require_relative '../daily_tree/tree_scraper.rb'

class Tree
  attr_accessor :scientific_name, :common_name, :comment, :stats, :height, :habit, :leaf, :form




  @@all = []
  def initialize(tree_names = nil, tree_data = nil)
    tree_names.each {|k,v| self.send("#{k}=",v)}

    @@all << self
  end



  def add_tree_attributes(tree_data= nil)
    tree_data.each {|k,v| self.send("#{k}=", v)}
    self
  end

  @@all_trees[1].add_tree_attributes(tree_data)
  # def self.create_from_collection(trees_array)
  #   trees_array.each do |tree|
  #     Tree.new(tree)
  #   end
  # end


  def self.all
    @@all
  end


end
