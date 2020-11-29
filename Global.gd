extends Node

onready var world = get_node("/root/World")
onready var gui = world.get_node("Interface")

const player_scene = preload("res://Entities/Player/Player.tscn")

var rng = RandomNumberGenerator.new()


export var level_scenes = [
	preload("res://Levels/Tutorial1.tscn"),
	preload("res://Levels/Tutorial2.tscn"),
	preload("res://Levels/LevelOne.tscn"),
	preload("res://Levels/LevelTwo.tscn")
]

var player = null
var current_level = -1
var current_level_instance = null
var score = 0 setget set_score;

func set_score(value):
	score = value
	gui.update_score(score)

func _ready(): 
	load_next_level()
	rng.randomize()
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

func load_next_level() -> void:
	if current_level_instance != null: 
		current_level_instance.queue_free()
		for node in world.get_tree().get_nodes_in_group("money"):
			node.queue_free()
		
	
	current_level += 1
	
	if current_level >= level_scenes.size() -1: 
		current_level = rng.randi_range(2, level_scenes.size() -1)
	
	var level_scene = level_scenes[current_level]
	
	current_level_instance = level_scene.instance()

	add_entity_to_world(current_level_instance)

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false
	
func update_player_health(new_health):
	gui.update_health(new_health)
	
func get_vial_count():
	var vials = world.get_tree().get_nodes_in_group("vial")
	var size = vials.size()
	gui.update_vial_count(size)
	return size
