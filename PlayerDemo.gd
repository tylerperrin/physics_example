extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 300  # pixels/s
var gravity = 250 # pix/s/s
var jump_speed = -300

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	#var collision = move_and_collide(velocity * delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
