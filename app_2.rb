require 'bundler'
Bundler.require

require_relative 'lib/player'



# La méthode qui retourne un message au début du jeu

  puts "------------------------------------------------"
  puts "| !!! STREET FIGHTER NEW GENERATION  !!!   	   |"
  puts "|      ! le dernier survivant                  |"
  puts "------------------------------------------------"

puts "Quel est ton nom de combattant ?"
print ">"
user_name = gets.chomp
user = HumanPlayer.new(user_name)

bot_1 = Player.new('Chloé')
bot_2 = Player.new('Loïc')
enemies = [bot_1, bot_2]


while user.live_points > 0 && (bot_1.live_points > 0 || bot_2.live_points > 0)
 
  
  puts "Voici l'état de #{user_name}"
  puts user.show_state

  puts 'Quelle action veux-tu effectuer ?'
  puts 'a - chercher une meilleure arme'
  puts 's - chercher à se soigner'
  puts "****************************************"
  puts 'Attaquer un joueur en vue :'
  print "0 - "
  bot_1.show_state
  print "1 - "
  bot_2.show_state

  print ">> "
  action = gets.chomp

  if action == "a"
  	user.search_weapon
  elsif action == "s"
	user.search_health_pack
  elsif action == "0"
  	user.attacks(bot_1)
  elsif action == "1"
  	user.attacks(bot_2)
  else
    puts "!!! Erreur de saisie !!!"
  end
  puts 
  puts " Les autres joueurs t'attaquent !"

  enemies.each do |enemie|
    if enemie.live_points > 0 
      enemie.attacks(user)
    end
  end
end

puts "La partie est finie " 
if user.live_points > 0 
  puts " BRAVO ! TU AS GAGNE !"
else
  puts " Loser ! Tu as perdu !"
end
