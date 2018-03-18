class Tree
  attr_accessor :common_name, :scientific_name, :comment, :stats, :height, :habit, :leaf, :form


  @@all = []

  def initialize(scraped_tree_names, tree_data) #<-- I want this to create a new instance of a tree, and assign the attributes and then add it to the @@all collection


    
    tree_data.each {|k,v| self.send("#{k}=",v)}


    @@all << self

  end




end
