require 'nokogiri'
require 'pry'
require_relative  "./scraper"

class CLI


  def call
    make_trees
    menu
  end

  def make_trees
    new_trees = Scraper.new
    new_trees.scrape_tree_index_page
    new_trees
  end

  # def add_attributes_to_trees
  # end


#   def call
#      #<-- When I call this I want it to create a new instance of tree
#     menu
#
#   end
#

#
# def random_tree
#   trees.all.sample
# end
#
#
#
#     def menu
#     puts "Hello! Would you like to see all the trees? ('yes' or 'no')"
#     input = nil
#     while input != "exit"
#       input = gets.strip.downcase
#     case input
#     when "yes"
#       make_trees
#     when "no"
#       #* random_tree
#     when "exit"
#         puts "Have a nice day!"
#
#         exit
#       else puts "**Invalid Input**"
#       end
#
#       menu
#     end
  end
