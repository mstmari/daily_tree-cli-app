class DailyTree::Tree
  attr_accessor :name, :description, :stats


  def self.today
    puts "The tree of the day is:"
    puts "*Western Soapberry*"

    pupu = tree = self.new
    tree.name = "Western soapberry"
    tree.description = puts "tree description"
    tree.stats = puts "tree stats"
  end


end
