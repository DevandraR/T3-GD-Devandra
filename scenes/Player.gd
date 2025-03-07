extends CharacterBody2D

@export var gravity = 600.0
@export var walk_speed = 200
@export var jump_speed = -400
var max_jumps = 2
var jump_counter

@onready var sprite = $AnimatedSprite2D
@onready var walk_audio_player = $AudioStreamPlayer2D3
@onready var collision_audio_player = $CollisionSound

func _physics_process(delta):
	velocity.y += delta * gravity

	if is_on_floor:
		jump_counter = 0

	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		sprite.play("walk")  # Play walk animation
		sprite.flip_h = true
		walk_audio_player.play()
	elif Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
		sprite.play("walk")
		sprite.flip_h = false
		walk_audio_player.play()
	else:
		velocity.x = 0
		sprite.play("default")

	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("dash"):
		velocity.x = -walk_speed - 200
		sprite.play("walk")  # Play walk animation
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right") and Input.is_action_pressed("dash"):
		velocity.x = walk_speed + 200
		sprite.play("walk")  # Play walk animation
		sprite.flip_h = false

	if jump_counter <= max_jumps and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		jump_counter += 1
		sprite.play("jump")
	elif Input.is_action_pressed("ui_up"):
		sprite.play("jump")
	elif is_on_floor() and Input.is_action_pressed("ui_down"):
		velocity.y = velocity.y + 100
		sprite.play("crouch")

	# "move_and_slide" already takes delta time into account.
	# Move the player and detect collisions
	var previous_velocity_x = velocity.x  # Store velocity before moving
	move_and_slide()

	# Check for collisions
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var normal = collision.get_normal()

		# Detect left/right collision (normal.x is -1 for left, 1 for right)
		if normal.x != 0 and previous_velocity_x != 0:
			print("Collided from the", "left" if normal.x > 0 else "right")  # Debug print
			collision_audio_player.play()  # Play collision sound
