extends CanvasLayer

func update_score(score):
	$Control/GoldCounter/Label.text = str(score)

func update_health(health):
	$Control/TextureProgress.value = health
