extends Node

onready var world = get_node("/root/World")
onready var player = get_node("/root/World/Player")

func _ready():
	pass

func add_entity_to_world(entity) -> void:
	world.add_child(entity)
