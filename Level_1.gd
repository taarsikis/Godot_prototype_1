extends Node2D

var door_1_alive = true

func _process(delta):
	$info/CanvasLayer/Label.text = str($Player.coins)
	$info/CanvasLayer/Label2.text = str($Player.hearts)

func _physics_process(delta):
	if $Player.coins == $doors.coins_number and door_1_alive:
		$doors/AnimatedSprite.play("opened")
		
		$doors.remove_child($doors/CollisionShape2D)
		door_1_alive = false
	elif $Player.coins == $doors2.coins_number:
		$doors2/AnimatedSprite.play("opened")
		
		$doors2.remove_child($doors2/CollisionShape2D)
		


func _on_Area2D3_body_entered(body):
	print(body.name)


func _on_heart_body_entered(body):
	if body.name == "Player":
		$Player.hearts += 1
		$Player.new_hearts += 1

		$heart/Anim.queue_free()
		$heart/CollisionShape2D.queue_free()
		$heart.is_in_game = false
