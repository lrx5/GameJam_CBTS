extends Area2D

var can_flash = true
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var stun_sprite: Sprite2D = $StunSprite
@onready var stun_timer: Timer = $StunTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rm = get_node("/root/MainScene/ResourceManager")
# Movement Variables
var move_speed = 50  # Speed of movement (units per second)
var move_distance = 50  # Distance to move in each direction
var current_direction = 0  # Current direction index (0 = right, 1 = down, 2 = left, 3 = up)
var target_position: Vector2  # The next position to move to

# Directions in the order: right, down, left, up
var directions = [
	Vector2(1, 0),  # Move right
	Vector2(0, 1),  # Move downw
	Vector2(-1, 0), # Move left
	Vector2(0, -1)  # Move up
]

func _ready() -> void:
	stun_sprite.visible = false
	set_process(false)
	target_position = position + directions[current_direction] * move_distance
	
func _process(delta: float) -> void:
	if State.flashing:
		stun_flash()

func _physics_process(delta: float) -> void:
	# Move the sprite towards the target position
	var direction_vector = (target_position - position).normalized()
	position += direction_vector * move_speed * delta
	# Check if the sprite has reached the target position
	if position.distance_to(target_position) < 1:
		# Adjust the position to exactly match the target
		position = target_position
		# Move to the next direction (right -> down -> left -> up)
		_change_direction()

func self_modulate(value: float):
	sprite_2d.modulate.r = value
func _on_area_entered(area: Area2D) -> void:
	if area is Area2D and area.name == "CameraBeam":
		area.queue_free()
		rm.capture_animal("Lion")
		queue_free()
	if area is Area2D and area.name == "CameraFlashArea":
		@warning_ignore("narrowing_conversion")
		self_modulate(0.5)
		set_process(true)
func _on_area_exited(area: Area2D) -> void:
	if area is Area2D and area.name == "CameraFlashArea":
		self_modulate(1)
		set_process(false)

func stun_flash():
	set_physics_process(false)
	stun_sprite.visible = true
	animation_player.play("stun_rotate")
	stun_timer.start()

func _on_stun_timer_timeout() -> void:
	set_physics_process(true)
	stun_sprite.visible = false

func _change_direction():
	# Cycle through directions (right -> down -> left -> up -> repeat)
	current_direction = (current_direction + 1) % 4
	# Set the new target position
	target_position = position + directions[current_direction] * move_distance
