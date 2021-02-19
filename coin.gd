extends Area2D



func _on_coin_body_entered(body):
	if body.name == "Player":
		body.add_coin()
		queue_free()
