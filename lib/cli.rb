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

  # def add_attributes_to_trees
  # end

  # urls.each do |url|
  #   tree_obj.scrape_tree_data(url)
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
    def menu
      puts "Hello! Would you like to see all the trees? ('yes' or 'no')"
      input = nil
          while input != "exit"
            input = gets.strip.downcase
          case input

            when "yes"
              Tree.all
            when "no"
              #* random_tree
            when "exit"
                puts "Have a nice day!"
                exit
            else puts "**Invalid Input**"
          end
        end
      menu
    end

end
