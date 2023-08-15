extends CharacterBody2D
var hp = 10000
var animated_sprite
var max_speed = 100
var speed = 0
var acceleration = 1200
var move_direction
var moving = false
var destination = Vector2.ZERO
@onready var healthBar = $playerHealth

func _get_hp():
	return hp

func _ready():
	animated_sprite = $AnimatedSprite2D
	healthBar.max_value = hp
	healthBar.value = hp

#works
func _unhandled_input(event):
	if event.is_action_pressed("MOUSE_BUTTON"):
		moving = true
		destination = get_global_mouse_position()
		
func _process(delta):
	_animation_loop()
func _physics_process(delta):
	_movement_loop(delta)
	_collision()
	if hp <= 0:
		queue_free()
		print("You died")
	
func _movement_loop(delta):
	if moving == false:
		speed = 0
	else:
		if Input.is_action_pressed("MOUSE_BUTTON"):
			destination = get_global_mouse_position()
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	velocity = position.direction_to(destination) * speed
	move_direction = rad_to_deg(destination.angle_to_point(position))
	
	if position.distance_to(destination) > 5:
		move_and_slide()
		
	else:
		moving = false
	

func _animation_loop():
	var anim_direction = "e"
	var anim_mode = "idle"
	var animation
	
	if move_direction <= 90 and move_direction >= -90:
		anim_direction = "w"
	else:
		anim_direction = "e"
	
	if moving == true:
		anim_mode = "walk"
	elif moving == false:
		anim_mode = "idle"
	
	animation = anim_mode + "_" + anim_direction
	animated_sprite.play(animation)


func _collision():
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		var body = collision.get_collider()
		print("Collided with: ", body.name)
		hp -= 10
		healthBar.value = hp


