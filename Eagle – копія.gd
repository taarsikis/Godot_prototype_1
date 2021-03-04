extends KinematicBody2D

onready var player = get_parent().get_node("Player")

var speed = 20
var follow = true
const FIRE = preload("res://Eagle_fire.tscn")
var is_alive = true
var Velocity = Vector2()

func kill():
	is_alive = false
	Velocity.x = 0
	#$anim.play("death")
	queue_free()

func _physics_process(delta):
	if is_alive:
		$AnimatedSprite.play("idle")
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.flip_v = true
		$FirePos.position.x = $FirePos.position.x * -1

		look_at(player.global_position)	
		if follow:
			var velocity = move_and_slide(Vector2(speed,0).rotated(rotation))
			if velocity.x < 0:
				$AnimatedSprite.flip_v = false

func _on_anim_animation_finished():
	if $anim.animation == "death":
		queue_free()

func fire():
	var fire = FIRE.instance()
	fire.position = get_global_position()
	fire.player = player
	get_parent().add_child(fire)
	$Timer.set_wait_time(1)

func _on_Area2D_area_entered(area):
	if area.name == "stop_follow":
		follow = false


func _on_Area2D_area_exited(area):
	if area.name == "stop_follow":
		follow = true


func _on_Timer_timeout():
	if not follow:
		fire()
