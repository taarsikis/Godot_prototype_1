extends Area2D

const SPEED = 500
var velocity = Vector2()

export var direction = 1

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	
	if direction == -1:
		$Sprite.flip_h = true
	
	translate(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_fire_body_exited(body):
	if body.name == "TileMap" :
		queue_free()
	elif body.name == "Enemy":
		body.kill()
	elif body.name == "Enemy2":
		body.kill()
	elif body.name == "Enemy3":
		body.kill()
	elif body.name == "Enemy4":
		body.kill()
	elif body.name == "Enemy5":
		body.kill()
	elif body.name == "Eagle":
		body.kill()
	print(body.name)
