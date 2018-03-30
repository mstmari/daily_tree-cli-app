require 'pry'

class Tree
  attr_accessor :comment, :height, :habit, :leaf, :form, :scientific_name, :common_name
  @@all = []
  def initialize(tree_names)
    tree_names.each {|k,v| self.send("#{k}=",v)}
    @comment = nil
    @height = nil
    @habit = nil
    @leaf = nil
    @form = nil

    @@all << self

  end


  def add_tree_attributes(tree_data)
      @comment = tree_data[:comment]
      @height = tree_data[:height]
      @habit = tree_data[:habit]
      @leaf = tree_data[:leaf]
      @form = tree_data[:form]

    self
  end

  def self.all
    @@all
  end

end
