extends Node2D

class_name BaseWeapon

const SHOOT_DIRECTIONS = {
	"ui_aim_right": Vector2.RIGHT, 
	"ui_aim_left": Vector2.LEFT, 
	"ui_aim_down": Vector2.DOWN, 
	"ui_aim_up": Vector2.UP
}

export var Projectile: PackedScene;

var _aim_directions = []

func init_aim_directions() -> Array:
	_aim_directions = []
	for shoot_action in ["ui_aim_right", "ui_aim_left", "ui_aim_down", "ui_aim_up"]:
		if Input.is_action_just_pressed(shoot_action):
			_aim_directions.append(shoot_action)
			
	
	return _aim_directions;

func get_attack_direction() -> Vector2:
	return SHOOT_DIRECTIONS[_aim_directions.back()]

func is_attacking() -> bool:
	return _aim_directions.size() > 0

func spawn_projectiles(direction) -> void:
	for loc in $AttackStartPoints.get_children():
		var b = Projectile.instance()
		b.direction = direction
		b.position = global_position + loc.position + (direction * 8)
		b.rotation = loc.rotation
		
		print(direction);
		print(direction * loc.rotation)
		get_tree().get_root().add_child(b)
