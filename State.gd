extends Node2D
class_name State

onready var fsm = get_parent()
onready var host = $"../.."

func enter():
	pass

func exit(new_state) -> void:
	print("Exited state: ", name)
	fsm.change_to(new_state);

# Overload these optionally
func process(delta: float) -> void:
	pass
	
func physics_process(delta: float) -> void:
	pass

func input(event: InputEvent) -> void: 
	pass
