extends Area2D

var range = 500
var speed = 400  # Speed of the projectile
var direction = Vector2.ZERO  # The direction the projectile will move
@onready var sprite_2d: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	if direction == Vector2.LEFT:
		sprite_2d.rotation_degrees = 180 
	if direction == Vector2.RIGHT:
		sprite_2d.rotation_degrees = 0
	if direction == Vector2.DOWN:
		sprite_2d.rotation_degrees = 90
	if direction == Vector2.UP:
		sprite_2d.rotation_degrees = -90
	# Move the projectile in the specified direction
	position += direction * speed * delta
	# Optionally queue free if the projectile goes off-screen
	if position.x < -range or position.x > range or position.y < -range or position.y > range:
		queue_free()

# Function to set the direction of the projectile
func set_direction(new_direction: Vector2) -> void:
	direction = new_direction
