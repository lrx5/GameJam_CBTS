extends Node2D

# Packed Scenes for spawner
@export var tree_scene: PackedScene = load("res://Scenes/tree.tscn")
@export var stone_scene: PackedScene = load("res://Scenes/stone.tscn")
@export var grain_scene: PackedScene = load("res://Scenes/grain.tscn")

# Spawn Areas
@onready var tree_spawn_area: Area2D = $TreeSpawnArea
@onready var tree_spawn_shape: CollisionShape2D = $TreeSpawnArea/CollisionShape2D

# Number of Spawns
@export var tree_count: int = 10  # Number of trees to spawn


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_resources()

func spawn_resources():
	for i in range(tree_count):
		var tree_instance = tree_scene.instantiate()
		tree_instance.position = get_random_position_in_area() # Assign a random position
		add_child(tree_instance)

# Function to get a random position inside the Area2D's collision shape
func get_random_position_in_area() -> Vector2:
	var shape = tree_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return tree_spawn_area.position + Vector2(x, y)
