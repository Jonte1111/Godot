extends RigidBody2D
@export var hp = 100
@onready var oof = $oof
@onready var ray = $RayCast2D
var dead = false
var speed = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
#When the enemy's health is below zero, run the death function
func _process(delta):
	apply_central_impulse(Vector2(50,50).rotated(ray.rotation))
	if hp <= 0:
		death()

#If a death sound is not already playing, play it, then set the enemy to "dead"
func death():
	if !oof.playing and !dead:
		oof.play()
		dead = true

#When the sound effect is finished, remove the monster
func _on_oof_finished():
	queue_free()
