extends Node2D

# Packed Scenes for spawner
@export var tree_scene: PackedScene = load("res://Scenes/tree.tscn")
@export var stone_scene: PackedScene = load("res://Scenes/stone.tscn")
@export var grain_scene: PackedScene = load("res://Scenes/grain.tscn")
@export var chicken_scene: PackedScene = preload("res://Scenes/chicken.tscn")
# Spawn Areas Resources
@onready var tree_spawn_area: Area2D = $TreeSpawnArea
@onready var tree_spawn_shape: CollisionShape2D = $TreeSpawnArea/CollisionShape2D
@onready var stone_spawn_area: Area2D = $StoneSpawnArea
@onready var stone_spawn_shape: CollisionShape2D = $StoneSpawnArea/CollisionShape2D

# Spawn Areas Animals
@onready var chicken_spawn_area: Area2D = $ChickenSpawnArea
@onready var chicken_spawn_shape: CollisionShape2D = $ChickenSpawnArea/CollisionShape2D

# Number of Resource Spawns
@export var tree_count: int = 50 # Number of trees to spawn
@export var stone_count: int = 30  # Number of stone to spawn

# Number of Animal Spawns
@export var chicken_count: int = 10  # Number of stone to spawn


func _ready() -> void:
	spawn_trees()
	spawn_stones()
	spawn_chickens()

func spawn_trees():
	for i in range(tree_count):
		var tree_instance = tree_scene.instantiate()
		tree_instance.position = get_random_position_in_area_trees() # Assign a random position
		add_child(tree_instance)

# Function to get a random position inside the Area2D's collision shape
func get_random_position_in_area_trees() -> Vector2:
	var shape = tree_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return tree_spawn_area.position + Vector2(x, y)

func spawn_stones():
	for i in range(stone_count):
		var stone_instance = stone_scene.instantiate()
		stone_instance.position = get_random_position_in_area_stones() # Assign a random position
		add_child(stone_instance)

func get_random_position_in_area_stones() -> Vector2:
	var shape = stone_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return stone_spawn_area.position + Vector2(x, y)

func spawn_chickens():
	for i in range(chicken_count):
		var chicken_instance = chicken_scene.instantiate()
		chicken_instance.position = get_random_position_in_area_chickens() # Assign a random position
		add_child(chicken_instance)

func get_random_position_in_area_chickens() -> Vector2:
	var shape = chicken_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return chicken_spawn_area.position + Vector2(x, y)
