extends KinematicBody2D

export (int) var speed = 500

var velocity = Vector2()
var isBad = false
var current_direction = 'down'

var directions = [
	'right',
	'left',
	'up',
	'down'
]

func _ready():
	$Sprite_bad.visible = isBad
	$Sprite_good.visible = !isBad
	speed = rand_range(100, 600)
	print(speed)

func _process(delta):
	position.x = clamp(position.x, 0, 600)
	position.y = clamp(position.y, 0, 800)

func _physics_process(delta):
    random_move()
    move_and_slide(velocity)

func random_move():
	move(current_direction)

func move(direction):
	velocity = Vector2()
	if (direction == 'right'):
		velocity.x += 1
	if (direction == 'left'):
		velocity.x -= 1
	if (direction == 'down'):
		velocity.y += 1
	if (direction == 'up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func picked_up():
	if (isBad):
		Global.hp -= 1
		$Hurt.playing = true
	else:
		Global.score += 1
		$Pickup.playing = true

func _on_Area2D_body_entered(body):
	if(body.is_in_group('player')):
		picked_up()


func _on_Timer_timeout():
	queue_free()


func _on_Move_timer_timeout():
	var random = randi() % 4
	if(random < 4):
		current_direction = directions[random]


func _on_sound_finished():
	queue_free()
