extends Node2D

export (PackedScene) var pickup

func _ready():
	$AudioStreamPlayer.playing = true

func _process(delta):
	if (Global.hp <= 0):
		get_tree().change_scene("res://Game_Over.tscn")

func get_random_postion(width, height):
	var random_x = rand_range(1, width)
	var random_y = rand_range(1, height)
	return Vector2(random_x, random_y)

func _on_Timer_timeout():
	var how_many = randi() % 11 + 1
	for i in range(how_many):
		var new_pickup = pickup.instance()
		var random_bad = rand_range(1, 100)
		new_pickup.isBad = random_bad > 50
		new_pickup.position = get_random_postion(600, 800)
		$Pickups.add_child(new_pickup)
