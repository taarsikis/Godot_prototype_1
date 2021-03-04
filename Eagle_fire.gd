extends Area2D

var move = Vector2.ZERO
var look_vec = Vector2.ZERO
var player = null
var speed = 3

func _ready():
	
	look_vec = player.position - global_position

func _physics_process(delta):
	move = Vector2.ZERO
	
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move 


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Eagle_fire_body_exited(body):
	if body.name == "Player":
		body.kill()
		queue_free()
	print(body.name)
