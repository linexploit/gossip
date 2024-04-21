class View 
  attr_reader :content, :author

  def initialize
     @author, @content = create_gossip
  end
 
  def create_gossip
     puts "Yeah ! Génial, dis moi, t'es qui ?"
     print "> "
     input_author = gets.chomp
     puts "Okay, et tu veux balancer quoi ?"
     print "> "
     input_content = gets.chomp
     params = {author: input_author, content: input_content}
     return params
  end

  def display_gossip(gossip, index)
   puts "Auteur: #{gossip.author}, Contenu: #{gossip.content}"
  end

  def delete_gossip(the_gossips)
   puts "Quel gossip tu veux destroy cachotier ? Donne l'ID'"
   print "> "
   id_to_delete = gets.chomp.to_i
   the_gossips.delete_if { |gossip| gossip.id == id_to_delete }
   puts "Le gossip a été supprimé."
end 

end
