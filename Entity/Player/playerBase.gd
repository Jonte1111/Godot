extends "res://Entity/entityBase.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	_animation()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_move(delta)

func _move(delta):
	if moving == false:
		speed = 0
	else:
		if Input.is_action_pressed("MOUSE_BUTTON"):
			destination = get_global_mouse_position()
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	velocity = position.direction_to(destination) * speed
	direction = rad_to_deg(destination.angle_to_point(position))
	
	if position.distance_to(destination) > 5:
		move_and_slide()
		
	else:
		moving = false
	
func _unhandled_input(event):
	if event.is_action_pressed("MOUSE_BUTTON"):
		moving = true
		destination = get_global_mouse_position()
