extends KinematicBody2D

var Velocity = Vector2()
var direction = 1;
const gravity = 10
const speed = 30;
const Floor = Vector2(0,-1) 
var is_alive = true
var coin_scene = preload("res://coin.tscn")

func kill():
	var coin = coin_scene.instance()
	is_alive = false
	Velocity.x = 0
	$anim.play("death")
	coin.global_position = global_position
	get_tree().get_root().add_child(coin)

func _ready():
	if is_alive:
		$anim.play("walk")

func _process(delta):
	if is_alive:
		Velocity.x = direction * speed
	if not $RayCast2D.is_colliding() :
		direction *= -1
		$RayCast2D.position.x *= -1
#		$RayCast2D2.position.x *= -1
#		$RayCast2D3.position.x *= -1
		$anim.flip_h = bool(1-direction)
		$Area2D/damagerange.position.x *= -1
		$Area2D.position.x *= -1
		

	Velocity.y += gravity
	Velocity = move_and_slide(Velocity,Floor)
	if is_on_wall():
		_der()


func _der():
	direction *= -1
	$anim.flip_h = bool(1-direction)
	$RayCast2D.position.x *= -1
	$Area2D/damagerange.position.x *= -1
	$Area2D.position.x *= -1


func _on_anim_animation_finished():
	if $anim.animation == "death":
		queue_free()


func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		body.kill()
		
