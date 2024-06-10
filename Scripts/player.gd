extends CharacterBody2D

var speed = 100
var current_direction = "none"

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("move_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("move_down"):
		current_direction = "down"
		play_animation(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("move_up"):
		current_direction = "up"
		play_animation(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	
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
