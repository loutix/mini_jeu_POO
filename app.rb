require 'bundler'
Bundler.require

require_relative 'lib/player'

#

def fight(player1, player2)

 	while player1.live_points > 0 && player2.live_points > 0
		
	
			puts "voici l'état de nos combattants:" 
			player1.show_state #Instance.methode(argument)
			player2.show_state #Instance.methode(argument)

		puts 
			#le joueur 1 attaque le joueur 2. 
			puts "Passons à la phase d'attaque :"
			player1.attacks(player2) #Instance.methode(argument)
			player2.attacks(player1) #Instance.methode(argument)

		puts 

			puts "Voici l'état de nos joueurs"
			player1.show_state
			player2.show_state
		
		puts 
	
			puts "Passons à la phase d'attaque :"
			player1.attacks(player2) 

			 # If player2 is dead with the player1 attack, while boucle stop
		 
  			if player2.live_points <= 0
				break
		    end

			player2.attacks(player1) #Instance.methode(argument)
			puts 

		    if player1.live_points <= 0
				break
		    end

			puts "Voici l'état de nos joueurs"
			player1.show_state
			player2.show_state
			puts 
			
			puts "Passons à la phase d'attaque :"
			player1.attacks(player2) #Instance.methode(argument)
			
		    if player2.live_points <= 0
		      break
		    end

			player2.attacks(player1) #Instance.methode(argument)
		
		    if player1.live_points <= 0
		      break
		    end

			puts 

			puts "Voici l'état de nos joueurs"
			player1.show_state
			player2.show_state

	end


end

		#Juste après l'attaque de Josiane (player1) sur José (player2), 
		#rajoute un petit if qui teste si player2 est mort (ses points de vie sont négatifs ou nuls). 
		#Si c'est le cas, il nous faut sortir immédiatement de la boucle while : c'est faisable grâce à la ligne break.


		def perform 
			player1 = Player.new("Chloé")
			player2 = Player.new("Loïc")
			fight(player1, player2)
		end

		perform 



#binding.pry






