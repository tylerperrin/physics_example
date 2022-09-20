extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 300  # pixels/s
var gravity = 2000 # pix/s/s
var jump_speed = -750
var motion = Vector2()

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = Input.get_axis("ui_left", "ui_right") * speed
	#var collision = move_and_collide(velocity * delta)
	velocity = move_and_slide(velocity, Vector2.UP, true)
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
	if velocity.x < 0:
		transform.x.x = 1
		$Sprite.play("walkleft")
	elif velocity.x > 0:
		transform.x.x = -1
		$Sprite.play("walkleft")
	elif velocity.y > 0:
		$Sprite.play("jump")
	else:
		$Sprite.play("standleft")
		
	if is_on_floor() and Input.is_action_just_pressed("ui_down"):
		$Sprite.play("crouch")
		
func _on_killbox_body_entered(body):
	if body==self:
		get_tree().change_scene("res://gameover.tscn")
	

		
	

#skeleton, zombie, ghost, human
#skeleton finds flesh -> zombie
#zombie eats brain -> ghost
#ghost finds bones -> skeleton
