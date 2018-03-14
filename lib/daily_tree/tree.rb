class DailyTree::Tree
  attr_accessor :name, :description, :stats

  @@all = []

  def initialize(name = nil)
    @name = name
    @description = description
    @stats = stats

    @@all << self

  end

  #Here I want to create a new object of a tree that instantiates with a name, stats and a description.

  def self.today #<-- I want to be able to call this on the new instance of tree and have it the name of the tree
    puts "The tree of the day is: #{self.name}"
  end

  def self.description #<- I want to be able to call this method and have it give the description of my tree
    #@description
    puts "Here is a tree that is hardly ever seen and is not even widely available and yet it is one of the most adaptable and versatile trees available."
  end

  def self.stats #<-- I want to be able to call this and have it give the stats from the tree.
    #@stats

    puts "NAME: Western soapberry

    LATIN: Sapindus drummondii

    HEIGHT: 30 feet

    TYPE:  Deciduous"
  end


end
