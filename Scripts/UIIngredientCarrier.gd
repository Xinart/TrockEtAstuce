extends GridContainer
class_name UIIngredientCarrier


var current_list_ingredient :Array[String]
var ingredient_scene :PackedScene = load("res://Scenes/Objects/ingredient.tscn")
@export var nb_max_item :int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_ui_ingredients_from_current_list_ingredient():
	for ingredient in current_list_ingredient:
		var ui_ingredient :UIIngredient = ingredient_scene.instantiate()
		ui_ingredient.ingredient_name = ingredient
		ui_ingredient._update_image_with_name()
		add_child( ui_ingredient)
	printt(name,':',current_list_ingredient) 
