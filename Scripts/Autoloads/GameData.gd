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
		)
	
# 1.2
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
				["tissu","pioche"] # Player inventory 
				,[] # Farmer inventory 
				,["fer à cheval","corde"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("chapeau",["corde","tissu"]) # Object to find to pass the step
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
				["corde","tissu"] # Player inventory 
				,[] # Farmer inventory 
				,["fourche","bougie"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("porte serviette",["tissu","fourche"]) # Object to find to pass the step
		)
	])
	#Nv 2
	,Level.new([
		# 2.1
		LevelStep.new(
				["corde","casque"] # Player inventory 
				,["pastèque","pioche"] # Farmer inventory 
				,["épée","fer à cheval"] # Blacksmith inventory 
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
				["banane","corde"] # Player inventory 
				,["carotte","concombre","salade"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("fouet",["corde","pastèque"]) # Object to find to pass the step
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
				["poire","salade"] # Player inventory 
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
				["seau","chapeau"] # Player inventory 
				,["salade","pastèque","poire"] # Farmer inventory 
				,["casque","corde","perruque"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("cloche",["poire","seau"]) # Object to find to pass the step
		)
	])
	
	# Nv 3
	,Level.new([
		# 3.1
		LevelStep.new(
				["banane","clou"] # Player inventory 
				,["concombre","carotte"] # Farmer inventory 
				,["épée","craie"] # Blacksmith inventory 
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
				["bougie","tissu"] # Player inventory 
				,["salade","pastèque","poire"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,["lézard","seau","cactus"] # Stranger inventory 
			,IngredientData.new("abat jour",["seau","bougie"]) # Object to find to pass the step
		)
		# 3.4
		,LevelStep.new(
				["banane","piment"] # Player inventory 
				,["carotte","poire"] # Farmer inventory 
				,["tissu","épée"] # Blacksmith inventory 
				,["cactus","lézard"] # Stranger inventory 
			,IngredientData.new("dragon",["lézard","piment"]) # Object to find to pass the step
		)
		# 3.5
		,LevelStep.new(
				["craie","seau"] # Player inventory 
				,["salade","concombre","poire"] # Farmer inventory 
				,[] # Blacksmith inventory 
				,["cloche","cactus"] # Stranger inventory 
			,IngredientData.new("quille",["poire","craie"]) # Object to find to pass the step
		)
		# 3.6
		,LevelStep.new(
				["pastèque","clou"] # Player inventory 
				,["salade","concombre","banane"] # Farmer inventory 
				,["boulet","pioche"] # Blacksmith inventory 
				,["pioche","dragon"] # Stranger inventory 
			,IngredientData.new("boule de bowling",["pastèque","pioche"]) # Object to find to pass the step
		)
		# 3.7
		,LevelStep.new(
				["concombre","abat jour","fourche"] # Player inventory 
				,["piment","banane","salade"] # Farmer inventory 
				,["trombone","bougie","seau"] # Blacksmith inventory 
				,[] # Stranger inventory 
			,IngredientData.new("lampe",["bougie","seau","fourche"]) # Object to find to pass the step
		)
		# 3.8
		,LevelStep.new(
				["clou","pastèque"] # Player inventory 
				,["poire","cochon","salade"] # Farmer inventory 
				,["craie","trombone","tissu"] # Blacksmith inventory 
				,["dragon","boule de bowling","lampe"] # Stranger inventory 
			,IngredientData.new("rhinocéros",["cochon","clou"]) # Object to find to pass the step
		)
	])
]

