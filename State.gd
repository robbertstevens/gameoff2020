extends Node2D
class_name State

onready var fsm = get_parent()
onready var host = $"../.."

func enter():
	#print(host.name, " has entered: ", name)
	pass

func exit(new_state) -> void:
	#print(host.name, " has exited state: ", name)
	fsm.change_to(new_state);

func back() -> void:
	fsm.back()

# Overload these optionally
func process(_delta: float) -> void:
	pass
	
func physics_process(_delta: float) -> void:
	pass

func input(_event: InputEvent) -> void: 
	pass
