extends Node


var current_level_index :int = 0
var list_level : Array[Level] = [
	Level.new([
		LevelStep.new(
			["banane","tissu"]
			,["salade","concombre"]
			,[]
			,[] 
			,IngredientData.new("epee",["banane","concombre"])
		)
		,LevelStep.new(
			["bougie","clous"]
			,[]
			,["epee","marteau"]
			,[] 
			,IngredientData.new("trombone",["clous","marteau"])
		)
	])
	,Level.new([
		LevelStep.new(
			["seau","ail"]
			,["carotte","concombre","salade"]
			,[]
			,[] 
			,IngredientData.new("casque",["seau","carotte"])
		)
		,LevelStep.new(
			["serviette","concombre"]
			,["cactus","salade"]
			,["casque","fourche"]
			,[] 
			,IngredientData.new("plumeau",["concombre","salade"])
		)
	])
]

