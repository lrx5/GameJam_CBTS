extends CharacterBody3D

const SPEED = 1.0
@onready var player_sprite: AnimatedSprite3D = $AnimatedSprite3D

func _physics_process(_delta: float) -> void:
	
	var input_vector = Vector3.ZERO
	# Get the input for X and Y axes
	input_vector.x = Input.get_axis("Left", "Right")
	input_vector.z = Input.get_axis("Up", "Down")

	# Normalize the input vector to ensure diagonal movement isn't faster
	if input_vector != Vector3.ZERO:
		input_vector = input_vector.normalized()

	# Flip Sprite
	if input_vector.x > 0:
		player_sprite.flip_h = true
	if input_vector.x < 0:
		player_sprite.flip_h = false
	if input_vector.x != 0 or input_vector.z != 0:
		player_sprite.play("default")
	else:
		player_sprite.stop()

	# Handle Ordinance
	if Input.is_action_pressed("Ordinance"):
		# Put Punching Animation Here to Play
		pass
	# Handle Capture
	if Input.is_action_pressed("Capture"):
		# Capture Camera
		pass
	# Handle Flash
	if Input.is_action_pressed("Flash"):
		# Flash Camera
		pass
	# Handle Interact
	if Input.is_action_pressed("Interact"):
		# Interact
		pass

	# Apply the movement
	velocity = input_vector * SPEED
	move_and_slide()
