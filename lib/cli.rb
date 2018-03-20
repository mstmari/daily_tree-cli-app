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
    Tree.all.each.with_index do |tree, i|
      puts "  #{i}"
      puts "  Common Name:" + " #{tree.common_name}"
      puts "  Scientific Name:" + " #{tree.scientific_name}"

      # puts "  Hieght:" + " #{tree.height}"
      # puts "  Habit:" + " #{tree.habit}"
      # puts "  Leaf:" + " #{tree.leaf}"
      # puts "  Form:" + " #{tree.form}"
      # puts "  Comment:" + " #{tree.comment}"
      puts "----------------------"
  end
end



  def locate_by_common_name(common_name)


    #takes in the name string of a tree
    #returns and array of attributs for a given tree
  end

 # def random_tree
 #  display_trees.sample
 # end

def more_info(tree_name)
  #binding.pry
  tree = Tree.all[tree_name]#.each do |tree|
    puts "  Common Name:" + " #{tree.common_name}"
    puts "  Scientific Name:" + " #{tree.scientific_name}"
    puts "  Height:" + " #{tree.height}"
    puts "  Habit:" + " #{tree.habit}"
    puts "  Leaf:" + " #{tree.leaf}"
    puts "  Form:" + " #{tree.form}"
    puts "  Comment:" + " #{tree.comment}"
#end
end

    def menu
      puts "Hello! Would you like to see all the trees? ('yes' or 'no')"
      input = nil
          while input != "exit"
            input = gets.strip.downcase

            if input == "yes"
              #binding.pry
              display_trees
            puts "Would you like to see more information on a tree? Please enter the number you wish to see"
            tree_index = gets.strip.downcase.to_i
              more_info(tree_index)
            #     puts "Have a nice day!"
            #     exit
            # else puts "**Invalid Input**"
          end
        end
      menu
    end

end
