class CLI


  def call
    Scraper.scrape_tree_index_page
    menu
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

    if input.to_i.between?(1, 50)
      more_info(input.to_i)
      find_tree_by_number

    elsif input == "exit"
      puts "Have a Nice Day!"
      goodbye

    else puts  "*Invalid Input* "
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


#Refactor Scraper to no longer rely on class variables
#Refactor last Scraper method to only add attributes to a single tree at a time

#Refactor tree to only add attributes to one tree instance at a time
