extends KinematicBody2D
	
export var speed = 150
var screen_size

func _ready():
	
	screen_size = get_viewport().get_visible_rect().size
	randomize()
	var x_range = Vector2(100, 400)
	var y_range = Vector2(100, 400)

	var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
	var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	var random_pos = Vector2(random_x, random_y)
	position = random_pos
	
func _process(delta):
	position += transform.x * speed * delta
