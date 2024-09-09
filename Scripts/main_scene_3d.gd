extends Node3D

# Packed Scenes for spawner
@export var tree_scene: PackedScene = load("res://Scenes/tree_3d.tscn")
@export var stone_scene: PackedScene = load("res://Scenes/stone_3d.tscn")
@export var grain_scene: PackedScene = load("res://Scenes/grain_3d.tscn")

# Spawn Areas
@onready var tree_spawn_area: Area3D = $TreeSpawnArea
@onready var tree_spawn_shape: CollisionShape3D = $TreeSpawnArea/CollisionShape3D

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
func get_random_position_in_area() -> Vector3:
	var shape = tree_spawn_shape.shape as BoxShape3D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = 0
	var z = randf_range(-extents.z, extents.z)
	# Offset by the spawn area’s position
	return tree_spawn_area.position + Vector3(x, y, z)
