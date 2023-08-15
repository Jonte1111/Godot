extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#player = get_node("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#func _on_area_2d_area_entered(area):
	#print("Collision")


func _on_area_2d_body_entered(body):
	body.hp -= 10
	
