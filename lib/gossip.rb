#le M = pioche ds la db
require 'csv'

class Gossip
  attr_reader :content, :author

  def initialize(author, content)
    @author = author
    @content = content
    @the_gossips = [] 
    @the_gossips << {author: @author, content: @content} 
  end

  def save(filename = '/home/linexploit/THP/week_4/the_hacking_gossip_ruby_version_POO/db/gossip.csv')
    if File.zero?(filename)
      CSV.open(filename, 'w') do |csv|
        csv << ['Author', 'Content']
      end
    end
    CSV.open(filename, 'a') do |csv|
      @the_gossips.each do |gossip|
        csv << [gossip[:author], gossip[:content]]
      end
    end
    puts "Les gossips ont été enregistrés dans le fichier."
 end

end

# my_gossip = Gossip.new('José', 'Josiane ne sait pas se battre')