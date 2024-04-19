# 3 méthodes : 
# une qui gère la création d'un potin, 
# une qui gère l'affichage de la liste des potins, 
# et une qui permet de détruire un potin. 
# Une fois l'action effectuée (via le model), la méthode devra renvoyer vers la view.

require 'view'
require 'gossip'

class Controller
  attr_accessor :gossip, :view

   def initialize
    @gossip = gossip
   end

  def create_gossip
    @view = View.new
    params = @view.create_gossip

    # Et oui, pour ne pas nous emmêler trop les pinceaux, 
    # on va se débrouiller pour que la méthode create_gossip de la classe Controller 
    # soit liée à une méthode éponyme create_gossip de la classe View.
    # Comme ça c'est facile de s'en rappeler.
    @gossip =  Gossip.new(author, content)
    # gossip = Gossip.new("Jean-Michel Concierge", "Féfé est de Bordeaux")
    gossip.save

  end

end

