class DailyTree::CLI

def call
  puts "The tree of the day is:"
  todays_tree
  stats

end

  def todays_tree
    puts "*Red Oak* - 'Desription of the tree'"
  end

  def stats
    puts "Would you to see this tree's stats?"
end
end
