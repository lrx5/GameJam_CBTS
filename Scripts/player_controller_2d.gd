extends CharacterBody2D

const SPEED = 130.0
var sfx_can_play = true
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var walking_sfx: AudioStreamPlayer2D = $WalkingSFX
@onready var camera_flash: Area2D = $CameraFlash

func _physics_process(_delta: float) -> void:
	
	var input_vector = Vector2.ZERO
	# Get the input for X and Y axes
	input_vector.x = Input.get_axis("Left", "Right")
	input_vector.y = Input.get_axis("Up", "Down")

	# Normalize the input vector to ensure diagonal movement isn't faster
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()

	# If Facing Right
	if input_vector.x > 0:
		player_sprite.flip_h = true
		camera_flash.rotation_degrees = 0  # CameraFlash Facing Right
	# If Facing Left
	if input_vector.x < 0:
		player_sprite.flip_h = false
		camera_flash.rotation_degrees = 180  # CameraFlash Facing Left
	if input_vector.x != 0 or input_vector.y != 0:
		player_sprite.play("default")
		if sfx_can_play:
			play_walking_sfx()
	else:
		player_sprite.stop()
		stop_walking_sfx()

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

func play_walking_sfx():
	sfx_can_play = false
	walking_sfx.play()

func stop_walking_sfx():
	walking_sfx.stop()
	sfx_can_play = true

func _on_walking_sfx_finished() -> void:
	sfx_can_play = true
