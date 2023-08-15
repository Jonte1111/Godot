extends CharacterBody2D
@export var hp_max = 100
@export var hp = hp_max
@export var max_speed = 100
@export var speed = 0
@export var acceleration = 1200
@export var destination = Vector2.ZERO
@export var moving = false
@export var direction = rad_to_deg(destination.angle_to_point(position))

@onready var sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	_animation()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_move(delta)

func _move(delta):
	velocity = position.direction_to(destination) * speed
	velocity = position.direction_to(destination) * speed
	move_and_slide()
	
func _die():
	queue_free()
	
func _animation():
	var anim_direction = "e"
	var anim_mode = "idle"
	var animation
	
	if direction <= 90 and direction >= -90:
		anim_direction = "w"
	else:
		anim_direction = "e"
	
	if moving == true:
		anim_mode = "walk"
	elif moving == false:
		anim_mode = "idle"
	
	animation = anim_mode + "_" + anim_direction
	sprite.play(animation)
