require 'nokogiri'
require 'pry'
require_relative  "./scraper"

class CLI

  def call
    make_trees
    menu
  end

  def make_trees
    #binding.pry
    new_trees = Scraper.scrape_tree_index_page
    new_trees
  end

  def display_trees
    Tree.all.each.with_index do |tree, idx|
      binding.pry
      puts "  #{idx}"
      puts "  Common Name:" + " #{tree.common_name}"
      puts "  Scientific Name:" + " #{tree.scientific_name}"
      puts "----------------------"
    end
  end


  def more_info(tree_num)
    #  binding.pry
    tree = Tree.all[tree_num]
    "  Common Name:" + " #{tree.common_name}"
    "  Scientific Name:" + " #{tree.scientific_name}"
    "  Height:" + " #{tree.height}"
    "  Habit:" + " #{tree.habit}"
    "  Leaf:" + " #{tree.leaf}"
    "  Form:" + " #{tree.form}"
    "  Comment:" + " #{tree.comment}"
    #binding.pry
    tree
  end

  def goodbye
    puts "Have a nice day!"

    exit
  end


  def find_tree_by_number
    puts "******************"
    puts "  Please enter the number of the tree you would like to see more information on?"
    puts "  (or 'exit')"
    puts "******************"

    input = gets.strip.downcase
    # binding.pry
    # if input == "exit"
    #   goodbye
    # else
      more_info(input.to_i)

      #find_tree_by_number

  end


def menu
  puts "Hello, would you like to see the trees?"
  input = gets.strip.downcase
      if input == "yes" || input == "y"
        display_trees

      elsif input == "no" || input == "n" || input == "exit"
            puts "Have a nice day!"
            goodbye
      end
      find_tree_by_number
end
#   def menu
#     puts "Hello! Would you like to see all the trees?"
#     input = nil
#       while input != "exit"
#     input = gets.strip.downcase
#
#     if input == "yes" || input == "y"
#       display_trees
#
#       find_tree_by_number
#       #binding.pry
#     elsif input == "no" || input == "n" || input == "exit"
#       puts "Have a nice day!"
#       goodbye
#     else puts "**Invalid Input**"
#     end
#     #menu
# end
#
#   end




end
