extends Node

export var player_scene = preload("res://Entities/Player/Player.tscn")

export var level_scenes = [
	preload("res://LevelOne.tscn"),
	#preload("res://LevelTwo.tscn")
]

onready var world = get_node("/root/World")

var player = null
var current_level = null

func _ready():
	randomize()
	call_deferred("load_random_level")

func add_entity_to_world(entity) -> void:
	call_deferred("_add_child_to_world", entity)

func spawn_player(position) -> void: 
	var spawn_player = false
	
	if player == null:
		player = player_scene.instance()
		spawn_player = true
		
	player.global_position = position
	
	if spawn_player: add_entity_to_world(player)

func _add_child_to_world(entity):
	world.add_child(entity)

func load_random_level() -> void:
	if current_level != null: current_level.queue_free()
	
	var level_index = randi() % level_scenes.size()
	var level_scene = level_scenes[level_index]
	
	current_level = level_scene.instance()

	add_entity_to_world(current_level)
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("new level")
		load_random_level()
