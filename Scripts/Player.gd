extends UIIngredientCarrier
class_name Player

var list_base_ingredients :Array[String]

var player_ui_ingredient_to_trade : UIIngredient
var merchant_ui_ingredient_to_trade : UIIngredient

# Called when the node enters the scene tree for the first time.
func _ready():
	# Get the list of single base ingredients
	for ingredient_data in PlayerData.list_recipes:
		for base_ingredient_name in ingredient_data.list_ingredient:
			if base_ingredient_name not in list_base_ingredients:
				list_base_ingredients.append(base_ingredient_name)
	
	list_base_ingredients.shuffle()
	# Add to the player list random ingredients that are not needed for the current level
	for ingredient in list_base_ingredients:
		if ingredient not in PlayerData.list_recipes[PlayerData.current_recipe_index_to_found].list_ingredient:
			if current_list_ingredient.size() != nb_max_item:
				current_list_ingredient.append(ingredient)
			else:
				break
	update_ui_ingredients_from_current_list_ingredient()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_mouse_left_click"):
		for ui_ingredient : UIIngredient in get_tree().get_nodes_in_group("UI_Ingredient"):
			if ui_ingredient.is_mouse_over:
				if ui_ingredient.get_parent().name == name:
					if player_ui_ingredient_to_trade:
						player_ui_ingredient_to_trade.is_selected = false
					player_ui_ingredient_to_trade = ui_ingredient
					player_ui_ingredient_to_trade.is_selected = true
				else:
					if merchant_ui_ingredient_to_trade:
						merchant_ui_ingredient_to_trade.is_selected = false
					merchant_ui_ingredient_to_trade = ui_ingredient
					merchant_ui_ingredient_to_trade.is_selected = true


func _on_trade_button_button_down():
	var ui_merchant : UIIngredientCarrier = merchant_ui_ingredient_to_trade.get_parent()

	remove_child(player_ui_ingredient_to_trade)
	ui_merchant.add_child(player_ui_ingredient_to_trade)
	player_ui_ingredient_to_trade.is_selected = false
	
	ui_merchant.remove_child(merchant_ui_ingredient_to_trade)
	add_child(merchant_ui_ingredient_to_trade)
	print(merchant_ui_ingredient_to_trade.get_parent().name)
	merchant_ui_ingredient_to_trade.is_selected = false
	
	
	ui_merchant.current_list_ingredient = ui_merchant.current_list_ingredient.filter(
		func(ingredient) -> bool: return ingredient != merchant_ui_ingredient_to_trade.ingredient_name )
	ui_merchant.current_list_ingredient.append(player_ui_ingredient_to_trade.ingredient_name)
	
	
	current_list_ingredient = current_list_ingredient.filter(
		func(ingredient) -> bool:return ingredient != player_ui_ingredient_to_trade.ingredient_name )
	current_list_ingredient.append(merchant_ui_ingredient_to_trade.ingredient_name)
	
	printt("Player",current_list_ingredient)
