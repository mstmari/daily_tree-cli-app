class DailyTree::CLI

def call
  todays_tree

  goodbye
end

  def todays_tree
    DailyTree::Tree.today
    menu
  end

    def description
    puts "Here is a tree that is hardly ever seen and is not even widely available and yet it is one of the most adaptable and versatile trees available."
    end

    def gets_stats

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
            gets_stats
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
