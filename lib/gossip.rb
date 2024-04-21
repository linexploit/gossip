#le M = pioche ds la db
require 'csv'

class Gossip
  attr_reader :content, :author, :id

  @@id_counter = 0

  def initialize(author, content)
    @author = author
    @content = content
    @id = @@id_counter += 1
  end

  def save(filename = '/home/linexploit/THP/gossip/db/gossip.csv')
    if File.zero?(filename)
      CSV.open(filename, 'w') do |csv|
        csv << ['Author', 'Content']
      end
    end
    CSV.open(filename, 'a') do |csv|
      csv << [@author, @content]
    end
    puts "Les gossips ont été enregistrés dans le fichier."
 end

 def self.all(filename = '/home/linexploit/THP/gossip/db/gossip.csv')
  gossips = []
  # 1) Création d'un tableau vide qui s'appelle all_gossips
  # 2) Chaque ligne du CSV est lue et un objet Gossip est créé pour chaque ligne
  # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
  # 2-b) all_gossips << gossip_provisoire - permet de rajouter le gossip provisoire au tableau
  # end
  # 3) return all_gossips - on renvoie le résultat

  CSV.foreach(filename, headers: true) do |row|
   # L'option headers: true indique que la première ligne du fichier CSV contient les en-têtes de colonnes, 
   # qui sont ignorés lors de la lecture des lignes de données. 
    gossip = Gossip.new(row['Author'], row['Content'])
    gossips  << gossip
  end
  gossips
end



end

# my_gossip = Gossip.new('José', 'Josiane ne sait pas se battre')