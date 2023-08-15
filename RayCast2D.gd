extends RayCast2D
@onready var player_pos = get_parent().get_parent().get_node("player").global_position
var curr_pos


# Called when the node enters the scene tree for the first time.
func _onready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	curr_pos = player_pos
	
	rotation = curr_pos.angle_to_point(global_position) + 90
	player_pos = get_parent().get_parent().get_node("player").global_position
	force_raycast_update()
	
