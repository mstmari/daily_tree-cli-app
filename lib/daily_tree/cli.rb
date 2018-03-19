require 'nokogiri'
require 'pry'
require 'colorize'

require_relative '../daily_tree/tree.rb'
require_relative '../daily_tree/tree_scraper.rb'
class DailyTree::CLI


  def call
    Tree.new #<-- When I call this I want it to create a new instance of tree
    menu

  end
  def make_trees
    trees_array = Scraper.scrape_tree_index_page
    Tree.create_from_collection(trees_array)
  end

def random_tree
  trees.all.sample
end


    def menu
    puts "Hello! Would you like to see all the trees? ('yes' or 'no')"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
    case input
    when "yes"
      #*  trees.all
    when "no"
      #* random_tree
    when "exit"
        puts "Have a nice day!"

        exit
      else puts "**Invalid Input**"
      end

      menu
    end
  end
end
