extends CanvasLayer

func update_score(score):
	$Control/GridContainer/GoldCounter/Count.text = str(score)

func update_health(health):
	$Control/GridContainer/TextureProgress.value = health
	
func update_vial_count(count):
	$Control/GridContainer/VialCounter/Count.text = str(count)
