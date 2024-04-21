# Le travail du routeur sera simple : 
# c'est de demander ce que l'utilisateur veut faire
# et de lancer la bonne méthode dans la bonne classe, en fonction.

# Il y aura 3 choix : 
# créer un gossip, 
# voir la liste complète des gossips
# ou supprimer un gossip.
# Chaque action correspond à une méthode du controller.

# il propose les possibilités à notre utilisateur, 
# et en fonction de ce que celui-ci rentre, 
# il redirige vers la bonne méthode du controller


require 'controller'

class Router

  #On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller"
  def initialize
    @controller =  Controller.new
  end 

#rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit donc perform.
def perform 
  puts "WELCOME IN THE GOSSIP PROJECT"

  while true

    #on affiche le menu
    puts "Tu veux faire quoi jeune mouss' ?"
    puts "1\. Je veux créer un gossip"
    puts "2\. Afficher tous les potins"
    puts "3\. Détruire un potin"
    puts "4\. Je veux quitter l'app"
    params = gets.chomp.to_i #on attend le choix de l'utilisateur

    case params #en fonction du choix
    when 1
      puts "Nice, raconte !" 
      @controller.create_gossip

    when 2
      puts "Tu as choisi d'afficher les gossips, ouhlala..." 
      @controller.index_gossips

    when 3
      puts "Tiens,tiens, tiens... tu as choisi d'en delete une... ouhlala..."
      @controller.delete_gossip(@controller.the_gossips)

    when 4
      puts "Ciao Ciao !"
      break #Ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.

    else
      puts "Ce choix n'existe pas, merci de ressayer" #Si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". 
      #C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)

    end
  end
end

end

