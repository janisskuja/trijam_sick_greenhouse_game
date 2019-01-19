extends Control


func _on_Button_pressed():
	Global.start()
	get_tree().change_scene("res://Main.tscn")
