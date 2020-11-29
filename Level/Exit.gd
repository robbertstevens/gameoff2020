extends Position2D

var ready_to_progress: bool = false
		
func _process(delta):
	if ready_to_progress:
		$AnimationPlayer.play("open")
		
	
	if Global.get_vial_count() == 0:
		ready_to_progress = true


func _on_Area2D_body_entered(body):
	Global.load_next_level()
