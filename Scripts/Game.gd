extends Node
class_name Game

@onready var ingredient_needed_label = $CanvasLayer/Control/Panel/AskingIngredientContainer/MarginContainer/HBoxContainer/IngredientNeededLabel
@onready var level_label = $CanvasLayer/Control/Panel/Levelindicator/MarginContainer/HBoxContainer/Level_label
@onready var level_step_label = $CanvasLayer/Control/Panel/Stepindicator2/MarginContainer/HBoxContainer/levelStepLabel
@onready var step_ingredient = $CanvasLayer/Control/Panel/EndStepPanel/ColorRect/MarginContainer/StepIngredient

var list_base_ingredients :Array[String]
var current_list_merchant_ingredient :Array[String]
@export var nb_merchant :int = 2
@export var nb_item_per_merchant :int = 2

const explosion = preload("res://Visual/particules/explosion.tscn")
var nb_current_merchant_items :int
@onready var farmer :UIIngredientCarrier = $CanvasLayer/Control/Panel/merchantPanel/Etalage/farmer
@onready var traveler :UIIngredientCarrier = $CanvasLayer/Control/Panel/merchantPanel/Tente/traveler
@onready var blacksmith :UIIngredientCarrier = $CanvasLayer/Control/Panel/merchantPanel/Forge/blacksmith
@onready var end_step_panel :Panel = $CanvasLayer/Control/Panel/EndStepPanel
@onready var merge_player_ingredient_button = $CanvasLayer/Control/Panel/MarginContainer/HBoxContainer/MergePlayerIngredientButton

@onready var list_merchant_ui_ingredient_carrier : Array[UIIngredientCarrier] = [
	blacksmith
	,farmer
	,traveler
]

@onready var player :Player = $CanvasLayer/Control/Panel/Player
var current_level_step :LevelStep




# Called when the node enters the scene tree for the first time.
func _ready():
	end_step_panel.visible = false
	_set_data_for_step_of_current_level()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_merge_player_ingredient_button_button_down():
		
	var does_player_have_all_ingredients_for_current_recipe :bool = false
	for ingredient in GameData.list_level[GameData.current_level_index].current_level_step.ingredient_to_merge.list_ingredient:
		if ingredient in player.current_list_ingredient:
			does_player_have_all_ingredients_for_current_recipe = true
		else :
			does_player_have_all_ingredients_for_current_recipe = false
			break
			
	if does_player_have_all_ingredients_for_current_recipe:
		end_step_panel.visible = true
		var explosion_effect :CPUParticles2D = explosion.instantiate()
		merge_player_ingredient_button.add_child(explosion_effect)
	# remove selection on player when it combination
	if player.player_ui_ingredient_to_trade:
		player.player_ui_ingredient_to_trade.is_selected = false
	if player.merchant_ui_ingredient_to_trade:
		player.merchant_ui_ingredient_to_trade.is_selected = false
		
func _set_data_for_step_of_current_level()-> void:
	var current_level_step :LevelStep =  GameData.list_level[GameData.current_level_index].current_level_step
	print(GameData.list_level[GameData.current_level_index])
	farmer.current_list_ingredient = current_level_step.list_farmer_ingredient
	farmer.update_ui_ingredients_from_current_list_ingredient()
	
	traveler.current_list_ingredient = current_level_step.list_traveler_ingredient
	traveler.update_ui_ingredients_from_current_list_ingredient()
	blacksmith.current_list_ingredient = current_level_step.list_blacksmith_ingredient
	blacksmith.update_ui_ingredients_from_current_list_ingredient()
	player.current_list_ingredient = current_level_step.list_player_ingredient
	player.update_ui_ingredients_from_current_list_ingredient()
	
	level_label.text = str(GameData.current_level_index + 1)
	level_step_label.text = str(GameData.list_level[GameData.current_level_index].current_step_index + 1)
	
	ingredient_needed_label.text = current_level_step.ingredient_to_merge.name
	step_ingredient.ingredient_name = current_level_step.ingredient_to_merge.name
	step_ingredient._update_image_with_name()

func _on_exite_end_step_panelbutton_button_down():
	end_step_panel.visible = false
	GameData.list_level[GameData.current_level_index]._switch_to_next_step()
	if GameData.list_level[GameData.current_level_index].current_step_index == GameData.list_level[GameData.current_level_index].list_level_steps.size():
		GameData.current_level_index += 1
		$MerchantsAnimPlayer.play("next_level")
	else:
		_set_data_for_step_of_current_level()
