extends Control

func _process(delta):
	$Score.text = "SCORE: " + str(Global.score)
	$Health.text = "HP: " + str(Global.hp)