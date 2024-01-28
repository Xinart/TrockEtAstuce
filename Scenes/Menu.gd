extends Panel
class_name Menu 
@export_file('*.tscn') var game_entry_scene
@onready var credit_button = $Credit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_button_button_down():
	get_tree().change_scene_to_file(game_entry_scene)

func _on_credit_button_button_down():
	credit_button.visible = true

func _on_quit_button_down():
	get_tree().quit()
	
func _on_exit_credit_button_down():
	credit_button.visible = false

