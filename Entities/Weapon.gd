extends Node2D

onready var AnimationTree = $AnimationTree
onready var AnimationState = AnimationTree.get("parameters/playback")

const SHOOT_DIRECTIONS = {
	"ui_aim_right": Vector2.RIGHT, 
	"ui_aim_left": Vector2.LEFT, 
	"ui_aim_down": Vector2.DOWN, 
	"ui_aim_up": Vector2.UP
}

export var Bullet: PackedScene;

var direction = Vector2.DOWN
var prev_position = Vector2.ZERO
var velocity = Vector2.ZERO


func _process(delta) -> void:
	var aim_directions = []
	
	for shoot_action in ["ui_aim_right", "ui_aim_left", "ui_aim_down", "ui_aim_up"]:
		if Input.is_action_just_pressed(shoot_action):
			aim_directions.append(shoot_action)
		
	if aim_directions.size() > 0:
		var direction = SHOOT_DIRECTIONS[aim_directions.back()]
		
		print($ShotLocation.position)
		AnimationTree.set("parameters/Idle/blend_position", direction)
		AnimationTree.set("parameters/Slash/blend_position", direction)
		AnimationState.travel("Slash")
		print($ShotLocation.position)
		var b = Bullet.instance()
		b.direction = direction
		b.position = $ShotLocation.get_global_transform().get_origin() + (direction * 8)
		get_tree().get_root().add_child(b)
	else:
		AnimationState.travel("Idle")
