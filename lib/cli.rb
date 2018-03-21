require 'nokogiri'
require 'pry'
require_relative  "./scraper"

class CLI


  def call

    menu
  end

  def make_trees
  #binding.pry
    new_trees = Scraper.scrape_tree_index_page
    new_trees
    #binding.pry
  end

  def display_trees
    Tree.all.each.with_index do |tree, idx|
      #binding.pry
      puts "  #{idx}"
      puts "  Common Name:" + " #{tree.common_name}"
      puts "  Scientific Name:" + " #{tree.scientific_name}"
      puts "----------------------"
  end
end


def more_info(tree_num)
#  binding.pry
  tree = Tree.all[tree_num]
    puts "  Common Name:" + " #{tree.common_name}"
    puts "  Scientific Name:" + " #{tree.scientific_name}"
    puts "  Height:" + " #{tree.height}"
    puts "  Habit:" + " #{tree.habit}"
    puts "  Leaf:" + " #{tree.leaf}"
    puts "  Form:" + " #{tree.form}"
    puts "  Comment:" + " #{tree.comment}"

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

    input = gets.strip.to_i
    # if input == "exit"
    #   puts "Have a nice day!"
    #   goodbye
    more_info(input)

    find_tree_by_number

end


def menu
      puts "Hello! Would you like to see all the trees?"
      input = nil
          while input != "exit"
            input = gets.strip.downcase.to_s

          if input == "yes" || input == "y"

            make_trees

            #display_trees
            #find_tree_by_number
            #binding.pry
            elsif input == "no" || input == "n" || input == "exit"
              puts "Have a nice day!"
              goodbye
            else puts "**Invalid Input**"
          end
          #menu
        end

    end




end
