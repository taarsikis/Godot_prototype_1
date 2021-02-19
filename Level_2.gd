extends Node2D



func _process(delta):
	$info/CanvasLayer/Label.text = str($Player.coins)
	$info/CanvasLayer/Label2.text = str($Player.hearts)
