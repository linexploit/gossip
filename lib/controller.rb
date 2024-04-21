# 3 méthodes : 
# une qui gère la création d'un potin, 
# une qui gère l'affichage de la liste des potins, 
# et une qui permet de détruire un potin. 
# Une fois l'action effectuée (via le model), la méthode devra renvoyer vers la view.

require 'view'
require 'gossip'

class Controller
  attr_accessor :gossip, :view, :the_gossips

   def initialize
    @view = View.new
    @the_gossips = []
   end

  def create_gossip
    params = @view.create_gossip
    # Extraire les valeurs 'author' et 'content' du hash 'params'
    author = params[:author]
    content = params[:content]
    # Utiliser ces valeurs pour créer une nouvelle instance de Gossip
    @gossip = Gossip.new(author, content)
    @gossip.save
    # Ajouter le nouveau gossip à la liste des gossips
    @the_gossips << @gossip

    # Et oui, pour ne pas nous emmêler trop les pinceaux, 
    # on va se débrouiller pour que la méthode create_gossip de la classe Controller 
    # soit liée à une méthode éponyme create_gossip de la classe View.
    # Comme ça c'est facile de s'en rappeler.
    
    # gossip = Gossip.new("Jean-Michel Concierge", "Féfé est de Bordeaux")
  end

  def index_gossips
    @the_gossips.each_with_index do |gossip, index|
      @view.display_gossip(gossip, index +1)  end
  end

  def delete_gossip(the_gossips)
    @view.delete_gossip(gossip)
  end

  def load_gossips
    Gossip.all.each do |gossip|
      @the_gossips << gossip
    end
 end

end

