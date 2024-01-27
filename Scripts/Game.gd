extends Node
class_name Game

@onready var ingredient_needed_label = $CanvasLayer/Control/Panel/AskingIngredientContainer/MarginContainer/HBoxContainer/IngredientNeededLabel

var list_base_ingredients :Array[String]
var current_list_merchant_ingredient :Array[String]
@export var nb_merchant :int = 2
@export var nb_item_per_merchant :int = 2

var nb_current_merchant_items :int
@onready var farmer = $CanvasLayer/Control/Panel/merchantPanel/Etalage/farmer
@onready var traveler = $CanvasLayer/Control/Panel/merchantPanel/Tente/traveler
@onready var blacksmith = $CanvasLayer/Control/Panel/merchantPanel/Forge/blacksmith

@onready var list_merchant_ui_ingredient_carrier : Array[UIIngredientCarrier] = [
	blacksmith
	,farmer
	,traveler
]

@onready var player :Player = $CanvasLayer/Control/Panel/Player


# Called when the node enters the scene tree for the first time.
func _ready():
	# set nb max ingredients for all UIIngredientCarriers
	for ui_ingridient_carrier in list_merchant_ui_ingredient_carrier:
		ui_ingridient_carrier.nb_max_item = nb_item_per_merchant
		
	
	_update_label_with_current_recipe()
	
	# Get the list of single base ingredients
	for ingredient_data in PlayerData.list_recipes:
		for base_ingredient_name in ingredient_data.list_ingredient:
			if base_ingredient_name not in list_base_ingredients:
				list_base_ingredients.append(base_ingredient_name)
				

	# Add to the merchant list the needed ingredient for the current level
	for ingredient in PlayerData.list_recipes[PlayerData.current_recipe_index_to_found].list_ingredient:
		current_list_merchant_ingredient.append(ingredient)
		nb_current_merchant_items += 1
	
	# Remove from the base list of ingredient the ones neded for the recipe
	list_base_ingredients = list_base_ingredients.filter(func(ingredient)-> bool: return ingredient not in current_list_merchant_ingredient)

	# Add random other ingredient in the current list
	for i in (nb_merchant * nb_item_per_merchant):
		if nb_current_merchant_items == (nb_merchant * nb_item_per_merchant):
			break
		current_list_merchant_ingredient.append(list_base_ingredients.pick_random())
		# Remove from the base list of ingredient the ones neded for the recipe
		list_base_ingredients = list_base_ingredients.filter(func(ingredient)-> bool: return ingredient not in current_list_merchant_ingredient)
		nb_current_merchant_items += 1
	
	current_list_merchant_ingredient.shuffle()
	
	var index :int = 0
	
	for merchant_index in nb_merchant:
		for item_index in nb_item_per_merchant:
			list_merchant_ui_ingredient_carrier[merchant_index].current_list_ingredient.append(
				current_list_merchant_ingredient[index]
			)
			index += 1
		list_merchant_ui_ingredient_carrier[merchant_index].update_ui_ingredients_from_current_list_ingredient()
	
	for ingredient in current_list_merchant_ingredient:
		index += 1
		
	
	
	for ingredient in current_list_merchant_ingredient:
		list_merchant_ui_ingredient_carrier
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _update_label_with_current_recipe() -> void:
	ingredient_needed_label.text = PlayerData.list_recipes[PlayerData.current_recipe_index_to_found].name
	



func _on_merge_player_ingredient_button_button_down():
	var does_player_have_all_ingredients_for_current_recipe :bool = false
	for ingredient in PlayerData.list_recipes[PlayerData.current_recipe_index_to_found].list_ingredient:
		if ingredient in player.current_list_ingredient:
			does_player_have_all_ingredients_for_current_recipe = true
		else :
			does_player_have_all_ingredients_for_current_recipe = false
			break
			
	if does_player_have_all_ingredients_for_current_recipe:
		print("YEAH")
	else:
		print("NOPE")
