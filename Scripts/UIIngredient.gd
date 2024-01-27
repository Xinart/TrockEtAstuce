extends ColorRect
class_name UIIngredient

@export var ingredient_name :String
@export var size_scale_on_mouse_entered :float = 1.2
var is_mouse_over :bool = false
var is_selected :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if is_selected:
		color = Color(183,155,0,255)
	else:
		color = Color(255,255,255,255)

		

func _update_image_with_name()-> void:
	$image.texture = load("res://Visual/UI/" + ingredient_name + ".png")
	printt("SET UI INGREDIENT AS : ", ingredient_name)




func _on_mouse_entered():
	is_mouse_over = true


func _on_mouse_exited():
	is_mouse_over = false
