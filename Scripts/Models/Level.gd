class_name Level

var list_level_steps : Array[LevelStep]
var current_level_step :LevelStep
var current_step_index :int = 0

func _init(list_level_steps : Array[LevelStep]):
	self.list_level_steps = list_level_steps
	current_level_step = self.list_level_steps[current_step_index]
	
func _switch_to_next_step() -> void:
	current_step_index += 1
	if current_step_index < list_level_steps.size():
		current_level_step = list_level_steps[current_step_index]
	

