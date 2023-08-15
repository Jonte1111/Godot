extends Area2D

var _smoothed_mouse_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.

var player
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_smoothed_mouse_pos = lerp(_smoothed_mouse_pos, get_global_mouse_position(), 0.3)
	look_at(_smoothed_mouse_pos)
	
	
	
	
