extends KinematicBody2D

const scent_scene = preload("res://Entities/Scent.tscn")

export var MAX_SPEED: int = 80;
export var ACCELERATION: int = 500
export var FRICTION: int = 500;

var scent_timer: Timer = null

var scent_trail = []

func _ready():
	assert($Timers.has_node("ScentTimer"), "This node needs to have a ScentTimer")
	
	scent_timer = $Timers.get_node("ScentTimer")
	
	scent_timer.connect("timeout", self, "_add_scent")
	
func _add_scent():
	var scent = scent_scene.instance()
	scent.parent = self
	scent.position = position
	
	Global.add_entity_to_world(scent)
	
	scent_trail.push_front(scent);
	
func _on_Hurtbox_area_entered(area):
	$Stats.health -= area.base_damage
	print($Stats.health)
