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
      puts "  #{idx}"
      puts "  Common Name:" + " #{tree.common_name}"
      puts "  Scientific Name:" + " #{tree.scientific_name}"
      puts "----------------------"
    end
  end


  def more_info(tree_num)
    tree = Tree.all[tree_num]
    "  Common Name:" + " #{tree.common_name}"
    "  Scientific Name:" + " #{tree.scientific_name}"
    "  Height:" + " #{tree.height}"
    "  Habit:" + " #{tree.habit}"
    "  Leaf:" + " #{tree.leaf}"
    "  Form:" + " #{tree.form}"
    "  Comment:" + " #{tree.comment}"

    #more_info(tree_num)
    tree
  end

  def goodbye

    exit
  end


  def find_tree_by_number
    puts "******************"
    puts "  Please enter the number of the tree you would like to see more information on?"
    puts "  (or 'exit')"
    puts "******************"

    tree_index = nil

    tree_index = gets.strip.to_i

#binding.pry
      if tree_index < 101
      more_info(tree_index.to_i)

    elsif tree_index == "exit"
        goodbye

    else puts
      "**Invalid Input**"

    end
    find_tree_by_number
  end


  def menu
    puts "Hello, would you like to see the trees?"
    #input = nil

    input = gets.strip.downcase

    case input

    when "yes"
      display_trees
      find_tree_by_number

    when "no"
      puts "Have a nice day!"
      goodbye


    end
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
