extends Sprite



func _on_Hitbox_body_entered(body) -> void:
	if body.name == "Player":
		if int(get_tree().current_scene.name) == 0:
			get_tree().change_scene("res://Level_" + str(int(get_tree().current_scene.name) + 2) + ".tscn")
		else:
			print("res://Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
			get_tree().change_scene("res://Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
