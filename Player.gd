extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func _process(delta):
	position.x = clamp(position.x, 0, 600)
	position.y = clamp(position.y, 0, 800)

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

