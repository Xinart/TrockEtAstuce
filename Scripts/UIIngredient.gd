extends ColorRect
class_name UIIngredient

@export var ingredient_name :String
@export var size_scale_on_mouse_click :float = 1.2
@export var size_scale_on_mouse_hover :float = 1.1
var is_mouse_over :bool = false
var is_selected :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if is_selected:
		color = Color(183,155,0,255)
		scale.x = size_scale_on_mouse_click
		scale.y = size_scale_on_mouse_click
	else:
		color = Color(255,255,255,255)
		if !is_mouse_over :
			scale.x = 1
			scale.y = 1
		else:
			scale.x = size_scale_on_mouse_hover
			scale.y = size_scale_on_mouse_hover
			

		

func _update_image_with_name()-> void:
	$image.texture = load("res://Visual/UI/" + ingredient_name + ".png")
	printt("SET UI INGREDIENT AS : ", ingredient_name)




func _on_mouse_entered():
	is_mouse_over = true
	if !is_selected:
		scale.x = size_scale_on_mouse_hover
		scale.y = size_scale_on_mouse_hover
		


func _on_mouse_exited():
	is_mouse_over = false
	if !is_selected:
		scale.x = 1
		scale.y = 1
