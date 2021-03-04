extends KinematicBody2D

onready var player = get_parent().get_node("Player")

var speed = 20

func _physics_process(delta):
	$AnimatedSprite.play("idle")
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.flip_v = true

	look_at(player.global_position)	
	var velocity = move_and_slide(Vector2(speed,0).rotated(rotation))
	if velocity.x < 0:
		$AnimatedSprite.flip_v = false
