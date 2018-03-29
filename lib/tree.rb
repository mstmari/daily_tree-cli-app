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

  end


  def add_tree_attributes(all_trees)
    all_trees.each do |info|
      @comment = info[:comment]
      @height = info[:height]
      @habit = info[:habit]
      @leaf = info[:leaf]
      @form = info[:form]
    end
    self
  end

  def self.all
    @@all
  end

end
