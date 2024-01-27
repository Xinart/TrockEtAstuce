class_name LevelStep

var list_player_ingredient :Array[String]
var list_farmer_ingredient :Array[String]
var list_blacksmith_ingredient :Array[String]
var list_traveler_ingredient :Array[String]

var ingredient_to_merge : IngredientData

func _init(
	list_player_ingredient :Array[String]
	,list_farmer_ingredient :Array[String]
	,list_blacksmith_ingredient :Array[String]
	,list_traveler_ingredient :Array[String]
	,ingredient_to_merge :IngredientData
	):
	self.list_player_ingredient = list_player_ingredient
	self.list_farmer_ingredient = list_farmer_ingredient
	self.list_blacksmith_ingredient = list_blacksmith_ingredient
	self.list_traveler_ingredient = list_traveler_ingredient
	self.ingredient_to_merge = ingredient_to_merge
