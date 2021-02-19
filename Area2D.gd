extends Area2D
var is_in_game = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_in_game:
		$Anim.play("default")
