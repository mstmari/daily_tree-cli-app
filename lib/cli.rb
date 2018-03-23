require 'nokogiri'
require 'pry'
require_relative  "./scraper"

class CLI


  def call
    make_trees
    get_tree_details
    menu
  end

  def make_trees
    new_trees = []
    #binding.pry
    new_trees << Scraper.scrape_tree_index_page
    new_trees
  end

  def get_tree_details
    Scraper.scrape_url
    Scraper.scrape_tree_data
  end

  def display_trees
    Tree.all.each.with_index do |tree, i|
      puts "  #{i}"
      puts "  Common Name:" + " #{tree.common_name}"
      puts "  Scientific Name:" + " #{tree.scientific_name}"
      puts "----------------------"
    end
  end


  def more_info(tree_num)
    #binding.pry

    tree = Tree.all[tree_num]
    puts "  Common Name:" + " #{tree.common_name}"
    puts "  Scientific Name:" + " #{tree.scientific_name}"
    puts "  Height:" + " #{tree.height}"
    puts "  Habit:" + " #{tree.habit}"
    puts "  Leaf:" + " #{tree.leaf}"
    puts "  Form:" + " #{tree.form}"
    puts "  Comment:" + " #{tree.comment}"

  end

  def goodbye
    exit
  end


  def find_tree_by_number
    puts "******************"
    puts "  Please enter the number of the plant you would like to see more information on?"
    puts "  Enter a number between 1 - 50"
    puts "  (or 'exit')"
    puts "******************"

    input = gets.strip

    if (1..50) === input.to_i
      more_info(input.to_i)
      find_tree_by_number



    elsif input == "exit"
      puts "Have a Nice Day!"
      goodbye


    else
      puts  "*Invalid Input* "
      find_tree_by_number
    end
  end


  def menu
    puts "---------------"
    puts "Hello! welcome to Daily-tree, the plant gem, it returns 50 plants for you to learn about."
    puts "Would you like to see the plants?"
    puts "---------------"

    input = nil
    while input != "exit"
      input = gets.strip.downcase.to_s

      if input == "yes" || input == "y"

        display_trees
        find_tree_by_number

      elsif input == "no" || input == "n" || input == "exit"
        puts "Have a nice day!"
        goodbye

      else puts "-----"
           puts "**Invalid Input**"
           puts "Enter 'yes' or 'no'"
           puts "-----"
      end
      menu
    end

  end




end
