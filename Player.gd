extends KinematicBody2D

var velocity = Vector2()
const SPEED = 150
const GRAVITY = 10
const JUMP = 300
const FLOOR = Vector2(0,-1)
const FIRE = preload("res://fire.tscn")


var is_alive = true
var coins = 0
var hearts = 5
var new_hearts = 5

func add_coin():
	coins += 1

func kill():
	#$CollisionShape2D.queue_free()
	$Sprite.play("death")
	new_hearts -= 1
	if new_hearts == 0:
		is_alive = false
		$CanvasLayer/DeathScreen.show()
	#queue_free()

func _physics_process(delta):
	if is_alive == false :
		return
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$FirePos.position.x = abs($FirePos.position.x) * -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$FirePos.position.x = abs($FirePos.position.x)
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("ui_fire"):
		var fire = FIRE.instance()
		fire.direction = sign($FirePos.position.x)
		fire.position = $FirePos.global_position
		get_parent().add_child(fire)
	
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity,FLOOR)
	animate()

func animate():
	var anim = "idle"
	
	if new_hearts != hearts:
		anim = "death"
		hearts = new_hearts
	elif velocity.y > 0 and not $RayCast2D.is_colliding():
		anim = "jump"
	elif velocity.y < 0 and not $RayCast2D.is_colliding():
		anim = "fall"
	else:
		if velocity.x != 0:
			anim = "run"
			if velocity.x > 0 :
				$Sprite.flip_h = false
			if velocity.x < 0 :
				$Sprite.flip_h = true
	if $Sprite.animation != anim :
		$Sprite.play(anim)
