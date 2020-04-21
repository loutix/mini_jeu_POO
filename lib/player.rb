




class Player

	attr_accessor  :name, :live_points  # les 2 attributs de ma classe player
	

	def initialize(name)  # Initialise un nouveau player avec 10 points de vie
		@name = name
		@live_points = 10
	end


 	def show_state # méthode show_state qui afficher l'état de l'objet Player sur laquelle elle est exécutée  	
	 	return puts "#{@name} a #{@live_points } points points de vie"
 	end


	def gets_damage(domage) #méthode gets_damage qui prend en entrée un integer (= le nombre de dommages subit) et qui le soustraie au niveau de vie (@life_points) du joueur.
		@live_points = @live_points - domage
		if @live_points < 0 || @live_points == 0 #Une fois la soustraction faite, la méthode vérifie si @life_points est inférieur ou égale à zéro. Si c'est le cas, c'est que le joueur est mort : elle affiche un message "le joueur XXXX a été tué !".
			return puts "!!! le joueur #{@name} a été tué !!!"
		end
	end

					
	def attacks(player) 	#coder une méthode attacks qui permette de faire qu'un joueur attaque un autre. => player1.attacks(player2)#La méthode prend donc en entrée un objet Player qui est le joueur subissant l'attaque ;
		
		puts " le joueur #{self.name} attaque le joueur #{player.name}" #La méthode commence par annoncer "le joueur [nom de player1] attaque le joueur [nom de player2]" avec un puts ;
		
		domage = compute_damage #Maintenant, dans attacks, fais appel à compute_damage et stocke le résultat dans une variable.

		player.gets_damage(domage) #Fais subir les dégâts à l'autre Player en utilisant ces dommages et la méthode gets_damage.

		puts "il lui inflige #{domage} point de vie" 	#À présent puts une phrase qui explique ce qui vient de se passer : "il lui inflige XXXX points de dommages"
	
	end



	def compute_damage# dommge aléatoire
    	return rand(1..6) 
 	end



end


require "pry"

class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize(name)  
		@name = name
		@live_points = 100
		@weapon_level = 1
	end



	def show_state # méthode show_state qui afficher l'état de l'objet Player sur laquelle elle est exécutée  	
	 	return puts "#{@name} a #{@live_points } points points de vie et une arme de niveau #{@weapon_level}"
 	end

 	# new method including the 
 	def compute_damage# dommge aléatoire
    	return "la puissance de l'attaque avec arme est de #{rand(1..6) * @weapon_level}"
 	end

 	# get a new weapon
 	def search_weapon
 		new_weapon = rand(1..6) 
 	puts "tu as une nouvelle arme de niveau #{new_weapon}"

	 	if new_weapon > weapon_level
	 		@weapon_level = new_weapon 
	 			puts	" Ta nouvelle arme est plus puissante, tu changes d'arme !!!"
	 	else 	puts 	"ta nouvelle arme n'est pas meilleure, garde l'ancienne ....dommage"

	 	end 
 	end

 	def search_health_pack
 		health = rand(1..6)
	 	puts " Tu as joué au dé pour un pack santé et tu as obtneu #{health}" 

	 	if health == 1 
	 		puts "tu fais 1 au dé, pas de chance, pas de pack santé"
	 	
	 	elsif health >= 2 && health <= 5	 		
	 	puts "tu as fait entre 2 et 5 au dé,tu as gagné un pack santé de +50 points de vie"

			 		#le pack santé de + 50 points ne peut pas augmenter la vie de +100 points
			if @live_points >= 50 
			   @live_points = 100
				puts "tu as atteint le max de 100 points de vie"
			 		#si la vie est inférieure à 50 points à la base
			else @live_points = @live_points + 50
					puts "cool je t'ajoute 50 points de vie"
			end

		else 
				 puts "tu as fait 6 au dé,tu as gagné un pack santé de +80 points de vie"
	#le pack santé de + 50 points ne peut pas augmenter la vie de +100 points
		 	if @live_points >= 50 
		 		@live_points = 100
				puts "tu as atteint le max de 100 points de vie"
		 		#si la vie est inférieure à 50 points à la base
		 	else @live_points = @live_points + 80
				puts "cool je t'ajoute 80 points de vie"
			end
 		end 
 	end
end
# binding.pry
puts "end of file"

