extends Node2D

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
		var b = Bullet.instance()
		b.direction = SHOOT_DIRECTIONS[aim_directions.back()]
		b.position = get_global_transform().get_origin()
		get_tree().get_root().add_child(b)
