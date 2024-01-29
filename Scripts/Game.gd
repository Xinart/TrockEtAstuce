extends Node
class_name Game

@export_file('*.tscn') var end_game_scene
@onready var end_anim_player = $EndAnimPlayer
@onready var menu = $CanvasLayer/Control/Menu

@onready var ingredient_needed_label = $CanvasLayer/Control/Panel/AskingIngredientContainer/MarginContainer/HBoxContainer/IngredientNeededLabel
@onready var level_label = $CanvasLayer/Control/Panel/Levelindicator/MarginContainer/HBoxContainer/Level_label
@onready var level_step_label = $CanvasLayer/Control/Panel/Stepindicator2/MarginContainer/HBoxContainer/levelStepLabel
@onready var step_ingredient = $CanvasLayer/Control/Panel/EndStepPanel/ColorRect/EndStepPanel/StepIngredient
@onready var sfx_audio_stream_player_2d : AudioStreamPlayer2D = $SFXAudioStreamPlayer2D

@onready var player_inventory: Sprite2D = $CanvasLayer/PlayerInventory
@onready var player_inventory_init_scale_x = player_inventory.scale.x
@onready var player_inventory_init_scale_y = player_inventory.scale.y

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
@onready var merge_player_ingredient_button: Button = $CanvasLayer/Control/Panel/MergePlayerIngredientButton

@onready var etalage :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Etalage
@onready var forge :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Forge
@onready var tente :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Tente
@onready var etalage_closed :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Etalage_closed
@onready var forge_closed :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Forge_closed
@onready var tente_closed :TextureRect = $CanvasLayer/Control/Panel/merchantPanel/Tente_closed

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
	GameData.current_level_index = 0
	GameData.list_level[GameData.current_level_index].current_step_index = 0
	GameData.list_level[GameData.current_level_index].current_level_step = \
	GameData.list_level[GameData.current_level_index].list_level_steps[0]
	for level in GameData.list_level:
		level.current_step_index = 0
		level.current_level_step = level.list_level_steps[0]
	_set_data_for_step_of_current_level()
	Input.set_custom_mouse_cursor(load("res://Visual/yolo/pointeur_petit.png"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_menu"):
		menu.visible = !menu.visible
	
func _on_merge_player_ingredient_button_button_down():
		
	var does_player_have_all_ingredients_for_current_recipe :bool = false
	for ingredient in GameData.list_level[GameData.current_level_index].current_level_step.ingredient_to_merge.list_ingredient:
		if ingredient in player.current_list_ingredient:
			does_player_have_all_ingredients_for_current_recipe = true
		else :
			does_player_have_all_ingredients_for_current_recipe = false
			break
			
	if does_player_have_all_ingredients_for_current_recipe:
		sfx_audio_stream_player_2d.stop()
		sfx_audio_stream_player_2d.stream = load("res://Audio/vitory/Step_complete.mp3")
		sfx_audio_stream_player_2d.play()
		
		end_step_panel.visible = true
		var explosion_effect :CPUParticles2D = explosion.instantiate()
		merge_player_ingredient_button.add_child(explosion_effect)
		explosion_effect.global_position = merge_player_ingredient_button.global_position
	else:
		sfx_audio_stream_player_2d.stop()
		sfx_audio_stream_player_2d.stream = load("res://Audio/wrong.mp3")
		sfx_audio_stream_player_2d.play()
		
		end_anim_player.play("new_animation")
		await end_anim_player.animation_finished
	# remove selection on player when it combination
	if player.player_ui_ingredient_to_trade: 
		player.player_ui_ingredient_to_trade.is_selected = false
		player.player_ui_ingredient_to_trade = null
	if player.merchant_ui_ingredient_to_trade:
		player.merchant_ui_ingredient_to_trade.is_selected = false
		player.merchant_ui_ingredient_to_trade
		
func _set_data_for_step_of_current_level()-> void:
	
	#Check if we finished the game
	if GameData.list_level.size() == GameData.current_level_index:
		end_anim_player.play("transit_to_end")
		await end_anim_player.animation_finished
	else:
		
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
		
		ingredient_needed_label.text = current_level_step.ingredient_to_merge.name.to_upper()
		step_ingredient.ingredient_name = current_level_step.ingredient_to_merge.name
		step_ingredient._update_image_with_name()
		
		
		_update_ui_merchant_status()
		

func _on_exite_end_step_panelbutton_button_down():
	end_step_panel.visible = false
	GameData.list_level[GameData.current_level_index]._switch_to_next_step()
	if GameData.list_level[GameData.current_level_index].current_step_index == GameData.list_level[GameData.current_level_index].list_level_steps.size():
		GameData.current_level_index += 1
		sfx_audio_stream_player_2d.stop()
		sfx_audio_stream_player_2d.stream = load("res://Audio/vitory/Level complete.mp3")
		sfx_audio_stream_player_2d.play()
		
		$MerchantsAnimPlayer.play("next_level")
		
	else:
		_set_data_for_step_of_current_level()
		
func _go_to_end_scene():
	get_tree().change_scene_to_file(end_game_scene)
	
func _update_ui_merchant_status():
	if farmer.current_list_ingredient == []:
		etalage_closed.visible = true
		etalage.visible = false
	else:
		etalage_closed.visible = false
		etalage.visible = true
	
	if blacksmith.current_list_ingredient == []:
		forge_closed.visible = true
		forge.visible = false
	else:
		forge_closed.visible = false
		forge.visible = true
		
	if traveler.current_list_ingredient == []:
		tente_closed.visible = true
		tente.visible = false
	else:
		tente_closed.visible = false
		tente.visible = true




func _on_merge_player_ingredient_button_mouse_entered() -> void:
	player_inventory.scale.x = player_inventory_init_scale_x * 1.2
	player_inventory.scale.y = player_inventory_init_scale_y * 1.2


func _on_merge_player_ingredient_button_mouse_exited() -> void:
	player_inventory.scale.x = player_inventory_init_scale_x
	player_inventory.scale.y = player_inventory_init_scale_y
