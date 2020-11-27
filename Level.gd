extends YSort
class_name Level

onready var start_position = $Start

func _ready():
	Global.spawn_player(start_position.global_position)

func _on_Area2D_body_entered(body):
	Global.load_random_level()
