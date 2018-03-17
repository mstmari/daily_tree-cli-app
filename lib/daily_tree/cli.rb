# require_relative 'nokogiri'
# require_relative 'pry'
# require_relative 'open-uri'
# require_relative '../daily_tree/tree.rb'
# require_relative '../daily_tree/tree_scraper.rb'

class DailyTree::CLI

  #1. I want to check the load path, make sure that I am on the right path
  #2. I want to add pry and nokogiri to the file dependancies
  #3. I want to get the console working
  #4. I want to get feedback on the structure of how my CLI and tree class are interacting.



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
    #make_trees#Tree.new #<-- When I call this I want it to create a new instance of tree
    menu
    todays_tree #<-- this puts "The tree of the day is: and puts the #name of the tree"
    goodbye
  end

  def gather_trees
    #1. scrape raw data from site
    #2. parse data into correlating methods
    #3. create collection of trees
    #4. store each daily tree for later access

    #give the user the option to access a library of past trees

  end

  def description
  puts "Here is a tree that is hardly ever seen and is not even widely available and yet it is one of the most adaptable and versatile trees available."
  end

  def stats

    puts "NAME: Western soapberry

    LATIN: Sapindus drummondii

    HEIGHT: 30 feet

    TYPE:  Deciduous"
  end

  def goodbye
    puts "Be sure to check back tomorrow for another tree!"
  end


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
