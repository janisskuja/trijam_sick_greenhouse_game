extends Control

func _ready():
	$VBoxContainer/Final_Score.text = "YOUR SCORE: " + str(Global.score)

func _on_Start_Again_pressed():
	Global.start()
	get_tree().change_scene("res://Main.tscn")
