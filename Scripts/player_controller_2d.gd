extends CharacterBody2D

var speed = 80
var sfx_can_play = true
var can_flash = true
var can_capture = true
var slots_available = true
var menu_open = false
var in_cage = false
var is_punching = false
var is_flashing = false
var punching_sfx_finished = true
@onready var camera_beam_scene = preload("res://Scenes/camera_beam.tscn")
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var walking_sfx: AudioStreamPlayer2D = $WalkingSFX
@onready var flash_camera_sfx: AudioStreamPlayer2D = $FlashCameraSFX
@onready var flash_timer: Timer = $FlashTimer
@onready var capture_camera_sfx: AudioStreamPlayer2D = $CaptureCameraSFX
@onready var capture_timer: Timer = $CaptureTimer
@onready var flash_sprite: Sprite2D = $CameraFlashArea/FlashSprite
@onready var flash_sprite_timer: Timer = $CameraFlashArea/FlashSpriteTimer
@onready var camera_flash_area: Area2D = $CameraFlashArea
@onready var flashing: Timer = $Flashing
@onready var bgm: AudioStreamPlayer2D = $BGM
@onready var punching: AudioStreamPlayer2D = $Punching

var facing_direction = Vector2.RIGHT
var input_vector = Vector2.ZERO

func _ready() -> void:
	bgm.play()

func _physics_process(_delta: float) -> void:
	# Update player's position in the global state
	State.player_position = global_position
	
	if is_punching == false:
		input_vector.x = Input.get_axis("Left", "Right")
		input_vector.y = Input.get_axis("Up", "Down")
		# Normalize the input vector to ensure diagonal movement isn't faster
		if input_vector != Vector2.ZERO:
			input_vector = input_vector.normalized()
		# If Facing Right
		if input_vector.x > 0 and input_vector.y == 0:
			player_sprite.play("walk_side")
			player_sprite.flip_h = false
			camera_flash_area.rotation_degrees = 0  # CameraFlash Facing Right
			facing_direction = Vector2.RIGHT
		# If Facing Left
		if input_vector.x < 0 and input_vector.y == 0:
			player_sprite.play("walk_side")
			player_sprite.flip_h = true
			camera_flash_area.rotation_degrees = 180  # CameraFlash Facing Left
			facing_direction = Vector2.LEFT
		if input_vector.y > 0:
			player_sprite.play("walk_down")
			camera_flash_area.rotation_degrees = 90 # CameraFlash Facing Down
			facing_direction = Vector2.DOWN
		if input_vector.y < 0:
			player_sprite.play("walk_up")
			camera_flash_area.rotation_degrees = -90 # CameraFlash Facing Up
			facing_direction = Vector2.UP
		if input_vector.x != 0 or input_vector.y != 0:
			#player_sprite.play("default")
			if sfx_can_play:
				play_walking_sfx()
		if input_vector.x == 0 and input_vector.y == 0 and !is_punching and !is_flashing:
			player_sprite.play("default")
			stop_walking_sfx()
		else:
			#stop_walking_sfx()
			pass

	# Handle Ordinance
	if Input.is_action_pressed("Ordinance"):
		is_punching = true
		if punching_sfx_finished == true:
			punching.play()
			punching.volume_db = 0
			punching_sfx_finished = false
		if facing_direction == Vector2.RIGHT:
			player_sprite.play("punch_side")
		if facing_direction == Vector2.LEFT:
			player_sprite.play("punch_side")
		if facing_direction == Vector2.DOWN:
			player_sprite.play("punch_down")
		if facing_direction == Vector2.UP:
			player_sprite.play("punch_up")
	if Input.is_action_just_released("Ordinance"):
		is_punching = false
		punching.volume_db = -80
	# Handle Capture
	if Input.is_action_pressed("Capture") and slots_available:
		if can_capture and !menu_open and in_cage == false and State.state_at_boat == false:
			capture_camera_sfx.play()
			fire_camera_beam()
			can_capture = false
			capture_timer.start()
	# Handle Flash
	if Input.is_action_pressed("Flash"):
		if State.can_flash:
			is_flashing = true
			flash_camera_sfx.play()
			flash_sprite.visible = true
			can_flash = false
			State.can_flash = false
			State.flashing = true
			flashing.start()
			flash_timer.start()
			flash_sprite_timer.start()
			if facing_direction == Vector2.RIGHT or facing_direction == Vector2.LEFT:
				player_sprite.play("flash_side")
			if facing_direction == Vector2.DOWN:
				player_sprite.play("flash_down")
			if facing_direction == Vector2.UP:
				player_sprite.play("flash_up")
	if is_punching == false:
		velocity = input_vector * speed
		move_and_slide()

func play_walking_sfx():
	sfx_can_play = false
	walking_sfx.play()

func stop_walking_sfx():
	walking_sfx.stop()
	sfx_can_play = true

func _on_walking_sfx_finished() -> void:
	sfx_can_play = true
func _on_flash_timer_timeout() -> void:
	can_flash = true
	is_flashing = false
	State.can_flash = true
func _on_capture_timer_timeout() -> void:
	can_capture = true
func _on_flash_sprite_timer_timeout() -> void:
	flash_sprite.visible = false
func _on_flashing_timeout() -> void:
	State.flashing = false

func fire_camera_beam():
	var projectile = camera_beam_scene.instantiate()
	projectile.position = position
	projectile.set_direction(facing_direction)
	get_parent().add_child(projectile)


func _on_bgm_finished() -> void:
	bgm.play()


func _on_punching_finished() -> void:
	punching_sfx_finished = true
