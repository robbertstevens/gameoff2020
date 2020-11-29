extends Node

onready var world = get_node("/root/World")
onready var gui = world.get_node("Interface")

const player_scene = preload("res://Entities/Player/Player.tscn")

export var level_scenes = [
	preload("res://LevelOne.tscn"),
	#preload("res://LevelTwo.tscn")
]

var player = null
var current_level = null
var score = 0 setget set_score;

func set_score(value):
	score = value
	gui.update_score(score)

func _ready(): 
	load_random_level()
	gui.update_score(score)

func spawn_player(position) -> void: 
	var spawn_player = false
	
	if player == null:
		player = player_scene.instance()
		spawn_player = true
		
	player.global_position = position
	
	if spawn_player: add_entity_to_world(player)

func add_entity_to_world(entity):
	call_deferred("_add_child_to_world", entity) 

func _add_child_to_world(entity):
	world.add_child(entity)

func load_random_level() -> void:
	if current_level != null: current_level.queue_free()
	
	var level_index = randi() % level_scenes.size()
	var level_scene = level_scenes[level_index]
	
	current_level = level_scene.instance()

	add_entity_to_world(current_level)

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false
	
func update_player_health(new_health):
	gui.update_health(new_health)
