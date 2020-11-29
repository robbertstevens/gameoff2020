extends Node2D



func _process(delta):
	if not Input.is_action_just_pressed("ui_action_two"):
		return;
	
	if $PickUpBox.overlaps_body(Global.player):
		queue_free()

func _on_PickUpBox_body_entered(_body):
	$ActionIndicator.visible = true


func _on_PickUpBox_body_exited(_body):
	$ActionIndicator.visible = false
