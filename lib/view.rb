class View 
  attr_reader :content, :author

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

end
