require 'nokogiri'
require 'pry'
require 'colorize'

# require_relative '../daily_tree/tree.rb'
# require_relative '../daily_tree/tree_scraper.rb'
class DailyTree::CLI


# def call
#   make_trees
#   add_attributes_to_trees
#   menu
# end


        # def run
        #   make_students
        #   add_attributes_to_students
        #   display_students
        # end
        #
        # def make_students
        #   students_array = Scraper.scrape_index_page(BASE_PATH + 'index.html')
        #   Student.create_from_collection(students_array)
        # end
        #
        # def add_attributes_to_students
        #   Student.all.each do |student|
        #     attributes = Scraper.scrape_profile_page(BASE_PATH + student.profile_url)
        #     student.add_student_attributes(attributes)
        #   end
        # end
        #
        # def display_students
        #   Student.all.each do |student|
        #     puts "#{student.name.upcase}".colorize(:blue)
        #     puts "  location:".colorize(:light_blue) + " #{student.location}"
        #     puts "  profile quote:".colorize(:light_blue) + " #{student.profile_quote}"
        #     puts "  bio:".colorize(:light_blue) + " #{student.bio}"
        #     puts "  twitter:".colorize(:light_blue) + " #{student.twitter}"
        #     puts "  linkedin:".colorize(:light_blue) + " #{student.linkedin}"
        #     puts "  github:".colorize(:light_blue) + " #{student.github}"
        #     puts "  blog:".colorize(:light_blue) + " #{student.blog}"
        #     puts "----------------------".colorize(:green)
        #   end
        # end

  def call
    #make_trees Tree.new #<-- When I call this I want it to create a new instance of tree
    menu
    # todays_tree #<-- this puts "The tree of the day is: and puts the #name of the tree"
    # goodbye
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
