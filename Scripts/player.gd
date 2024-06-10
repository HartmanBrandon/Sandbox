extends CharacterBody2D

var speed = 50
var current_direction = "none"


func _physics_process(delta):
	get_input(delta)
	move_and_slide()

func get_input(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if Input.is_action_pressed("right"):
		current_direction = "right"
		play_animation(1)
	elif Input.is_action_pressed("left"):
		current_direction = "left"
		play_animation(1)
	elif Input.is_action_pressed("down"):
		current_direction = "down"
		play_animation(1)
	elif Input.is_action_pressed("up"):
		current_direction = "up"
		play_animation(1)
	else:
		play_animation(0)
	
	move_and_slide()

func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_sideways")
		elif movement ==  0:
			animation.play("idle_sideways")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("walk_sideways")
		elif movement ==  0:
			animation.play("idle_sideways")
	if direction == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("walk")
		elif movement ==  0:
			animation.play("idle")
	if direction == "up":
		animation.flip_h = false
		if movement == 1:
			animation.play("walk_backwards")
		elif movement ==  0:
			animation.play("idle_backwards")
