extends Node


var current_level_index :int = 0
var list_level : Array[Level] = [
	# NV 1
	Level.new([
		# 1.1
		LevelStep.new(
			["banane","carotte"] # Player inventory 
			,["salade","concombre"] # Farmer inventory 
			,[] # Blacksmith inventory 
			,[] # Stranger inventory 
			,IngredientData.new("pioche",["concombre","carotte"]) # Object to find to pass the step
		)# 1.2
			,LevelStep.new(
				["corde","tissu"] # Player inventory 
				,[] # Farmer inventory 
				,["fer à cheval","seau"] # Blacksmith inventory 
				,[] # Stranger inventory 
				,IngredientData.new("ceinture",["corde","fer à cheval"]) # Object to find to pass the step
			) 
			# 1.3
			,LevelStep.new(
				["banane","tissu"] # Player inventory 
				,["salade","concombre"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("épée",["banane","concombre"]) # Object to find to pass the step
			)
			# 1.4
			,LevelStep.new(
				["fer à cheval","pioche"] # Player inventory 
				,[] # Farmer inventory 
				,["seau","tissu"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("chapeau",["tissu","seau"]) # Object to find to pass the step
			)
			# 1.5
			,LevelStep.new(
				["seau","fer à cheval"] # Player inventory 
				,["salade","carotte"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("casque",["seau","carotte"]) # Object to find to pass the step
			)
			# 1.6
			,LevelStep.new(
				["corde","bougie"] # Player inventory 
				,[] # Farmer inventory 
				,["fourche","tissu"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("porte serviette",["tissu","fourche"]) # Object to find to pass the step
			)
		])
		#Nv 2
		,Level.new([
			# 2.1
			LevelStep.new(
				["épée","casque"] # Player inventory 
				,["pastèque","pioche"] # Farmer inventory 
				,["corde","fer à cheval"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("boulet",["corde","pastèque"]) # Object to find to pass the step
			)
			# 2.2
			,LevelStep.new(
				["concombre","corde"] # Player inventory 
				,["piment","banane"] # Farmer inventory 
				,["fer à cheval","fourche"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("faucille",["fer à cheval","concombre"]) # Object to find to pass the step
			)
			# 2.3
			,LevelStep.new(
				["banane","piment"] # Player inventory 
				,["carotte","concombre","salade"] # Farmer inventory 
				,["corde"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("fouet",["corde","concombre"]) # Object to find to pass the step
			)
			# 2.4
			,LevelStep.new(
				["salade","seau"] # Player inventory 
				,[] # Farmer inventory 
				,["fourche","faucille","pioche"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("plumeau",["fourche","salade"]) # Object to find to pass the step
			)
			# 2.5
			,LevelStep.new(
				["poire","bougie"] # Player inventory 
				,["banane","carotte","salade"] # Farmer inventory 
				,["corde","seau"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("perruque",["salade","corde"]) # Object to find to pass the step
			)
			# 2.6
			,LevelStep.new(
				["marteau","pioche"] # Player inventory 
				,["carotte","concombre"] # Farmer inventory 
				,["clou","bougie","fer à cheval"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("trombone",["clou","marteau"]) # Object to find to pass the step
			)
			# 2.7
			,LevelStep.new(
				["banane","chapeau"] # Player inventory 
				,["salade","pastèque","poire"] # Farmer inventory 
				,["casque","seau","perruque"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("cloche",["poire","seau"]) # Object to find to pass the step
			)
			])

			# Nv 3
		,Level.new([
			# 3.1
			LevelStep.new(
				["banane","fourche"] # Player inventory 
				,["concombre","carotte"] # Farmer inventory 
				,["épée","craie","clou"] # Blacksmith inventory 
				,["lézard"] # Stranger inventory 
			,IngredientData.new("cactus",["clou","concombre"]) # Object to find to pass the step
			)
			# 3.2
			,LevelStep.new(
				["pastèque","fourche"] # Player inventory 
				,[] # Farmer inventory 
				,["seau","chapeau","épée"] # Blacksmith inventory 
				,["piment","lézard","cactus"] # Stranger inventory 
			,IngredientData.new("porte-manteau",["fourche","seau"]) # Object to find to pass the step
			)
			# 3.3
			,LevelStep.new(
				["clou","tissu"] # Player inventory 
				,["salade","pastèque"] # Farmer inventory 
				,["bougie"] # Blacksmith inventory 
				,["lézard","seau","cactus"] # Stranger inventory 
			,IngredientData.new("abat jour",["seau","bougie"]) # Object to find to pass the step
			)
			# 3.4
			,LevelStep.new(
				["banane","fer à cheval"] # Player inventory 
				,["carotte","poire"] # Farmer inventory 
				,["tissu","épée"] # Blacksmith inventory 
				,["piment","lézard"] # Stranger inventory 
			,IngredientData.new("dragon",["lézard","piment"]) # Object to find to pass the step
			)
			# 3.5
			,LevelStep.new(
				["trombone","seau"] # Player inventory 
				,["salade","concombre","poire"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,["cloche","cactus","craie"] # Stranger inventory 
			,IngredientData.new("quille",["poire","craie"]) # Object to find to pass the step
			)
			# 3.6
			,LevelStep.new(
				["concombre","clou"] # Player inventory 
				,["salade","pastèque","banane"] # Farmer inventory 
				,["boulet","pioche"] # Blacksmith inventory 
				,["perruque","dragon"] # Stranger inventory 
			,IngredientData.new("boule de bowling",["pastèque","pioche"]) # Object to find to pass the step
			)
			# 3.7
			,LevelStep.new(
				["concombre","fouet","fourche"] # Player inventory 
				,["piment","banane","salade"] # Farmer inventory 
				,["trombone","bougie","seau"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("lampe",["bougie","seau","fourche"]) # Object to find to pass the step
			)
			# 3.8
			,LevelStep.new(
				["craie","pastèque"] # Player inventory 
				,["poire","cochon","salade"] # Farmer inventory 
				,["clou","trombone","tissu"] # Blacksmith inventory 
				,["dragon","boule de bowling","lampe"] # Stranger inventory 
			,IngredientData.new("rhinocéros",["cochon","clou"]) # Object to find to pass the step
			)
		])
	]
