require 'pry'
# require_relative '../daily_tree/tree_scraper.rb'

class Tree
  attr_accessor :scientific_name, :common_name, :comment, :height, :habit, :leaf, :form

  @@all = []
  def initialize(tree_names = nil, tree_data = nil)
    tree_names.each {|k,v| self.send("#{k}=",v)}
    @comment = nil
    @height = nil
    @habit = nil
    @leaf = nil
    @form = nil

    @@all << self
    #binding.pry
  end

  def add_tree_attributes(all_trees)

    all_trees.each do |info|
      @comment = info[:comment]
      @height = info[:height]
      @habit = info[:habit]
      @leaf = info[:leaf]
      @form = info[:form]
    end
    # binding.pry
    self
  end


  # def self.create_from_collection(trees_array)
  #   trees_array.each do |tree|
  #     Tree.new(tree)
  #   end
  # end




  def self.all
    @@all
  end

  def random_tree
   Tree.all.sample
  end

  def display_trees
    Tree.all
  end
end
