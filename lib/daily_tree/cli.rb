class DailyTree::CLI

  #1. I want to check the load path, make sure that I am on the right path
  #2. I want to add pry and nokogiri to the file dependancies
  #3. I want to get the console working
  #4. I want to get feedback on the structure of how my CLI and tree class are interacting.

  
  def call
    DailyTree::Tree.new #<-- When I call this I want it to create a new instance of tree
    todays_tree #<-- this puts "The tree of the day is: and puts the #name of the tree"
    goodbye
  end

  def todays_tree
    Tree.name
  end

  # def description
  # puts "Here is a tree that is hardly ever seen and is not even widely available and yet it is one of the most adaptable and versatile trees available."
  # end

  # def stats
  #
  #   puts "NAME: Western soapberry
  #
  #   LATIN: Sapindus drummondii
  #
  #   HEIGHT: 30 feet
  #
  #   TYPE:  Deciduous"
  # end

  # def goodbye
  #   puts "Be sure to check back tomorrow for another tree!"
  # end


  def menu
    puts "Would you to see this tree's stats? or a brief description (enter 'stats', 'description' or 'exit')"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "stats"
        stats
      when "description"
        description
      when "exit"
        puts "Make sure to check back tomorrow for a new tree!"

        exit
      else puts "**Invalid Input**"
      end

      menu
    end
  end
end
