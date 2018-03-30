

class Scraper


  #This method scrapes the index page and retireves the URL's to pass into to the profile page scraper method.

  #this method scrapes the tree index page and creates a hash including the scientific_name and common_name
  def self.scrape_tree_index_page

    tree = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/10/?"))
    @tree_names = []

    #starts at table then locates the 'tr' tag and searches that for the data included in the 'td' tag
    tree.at('table').search('tr').each do |tr|
      @tree_names << tr.search('td').map(&:text)
    end

    #this next section removes the nil values then assigns the names to their values
    #then creates and names all the trees

    @tree_names.map! do |a|
      tree = {scientific_name: a[0], common_name: a[1]}
      Tree.new(tree)
    end
    scrape_url
    scrape_tree_data

  end


  #-------------


  def self.scrape_url
    doc = Nokogiri::HTML(open("https://plants.ces.ncsu.edu/plants/category/trees/10/?"))
    urls = doc.css('.th-sci-name  a').map { |link| link['href'] }
    urls.collect do |url|
      "https://plants.ces.ncsu.edu#{url}"
    end
  end


  #-------------



  def self.scrape_tree_data

    scrape_url.each.with_index(1) do |url, indx|
      tree_data = {}
      #This first part of the method scrapes the individual plant page.
      doc = Nokogiri::HTML(open(url))
      new_array = doc.css(".plant_details").text.split("\n")

      #this part of the method parses the raw data found in '.plant_details' container.
      #There was some very weird spacing and set up, I first had to remove extra '"' and ',' and empty spaces that were originally
      #used to space out the data on the website.
      new_array.reject!{|a| a.nil? || (a.to_s.gsub(' ', '') == '') }
      #The next line splits the information at the ":" placing the 'key' and 'value' into different arrays so I can operate on and assign them.
      plant = new_array.map{|i| i.split(":")}
      #binding.pry
      #this next part iterates through the array of key and value and assigns the desired charecteristics.
      plant.map do |i|
        key = i[0].gsub(" ","")
        value = i[1]

        if key == "Comment"
          tree_data[:comment] = value
        elsif key == "Height"
          tree_data[:height] = value
        elsif key == "Habit"
          tree_data[:habit] = value
        elsif key == "Leaf"
          tree_data[:leaf] = value
        elsif key == "Form"
          tree_data[:form] = value
        end

      end
      Tree.all[indx].add_tree_attributes(tree_data)
    end
  end




end
