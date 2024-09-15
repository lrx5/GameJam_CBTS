extends Node2D

# Packed Scenes for spawner
@export var tree_scene: PackedScene = load("res://Scenes/tree.tscn")
@export var stone_scene: PackedScene = load("res://Scenes/stone.tscn")
@export var grain_scene: PackedScene = load("res://Scenes/grain.tscn")
@export var chicken_scene: PackedScene = preload("res://Scenes/chicken.tscn")
@export var wolf_scene: PackedScene = preload("res://Scenes/wolf.tscn")
@export var lion_scene: PackedScene = preload("res://Scenes/lion.tscn")
@export var cow_scene: PackedScene = preload("res://Scenes/cow.tscn")
@export var sheep_scene: PackedScene = preload("res://Scenes/sheep.tscn")
# Spawn Areas Resources
@onready var tree_spawn_area: Area2D = $TreeSpawnArea
@onready var tree_spawn_shape: CollisionShape2D = $TreeSpawnArea/CollisionShape2D
@onready var stone_spawn_area: Area2D = $StoneSpawnArea
@onready var stone_spawn_shape: CollisionShape2D = $StoneSpawnArea/CollisionShape2D

# Spawn Areas Animals
@onready var chicken_spawn_area: Area2D = $ChickenSpawnArea
@onready var chicken_spawn_shape: CollisionShape2D = $ChickenSpawnArea/CollisionShape2D
@onready var wolf_spawn_area: Area2D = $WolfSpawnArea
@onready var wolf_spawn_shape: CollisionShape2D = $WolfSpawnArea/CollisionShape2D
@onready var lion_spawn_area: Area2D = $LionSpawnArea
@onready var lion_spawn_shape: CollisionShape2D = $LionSpawnArea/CollisionShape2D
@onready var cow_spawn_area: Area2D = $CowSpawnArea
@onready var cow_spawn_shape: CollisionShape2D = $CowSpawnArea/CollisionShape2D
@onready var sheep_spawn_area: Area2D = $SheepSpawnArea
@onready var sheep_spawn_shape: CollisionShape2D = $SheepSpawnArea/CollisionShape2D
@onready var grain_spawn_area: Area2D = $GrainSpawnArea
@onready var grain_spawn_shape: CollisionShape2D = $GrainSpawnArea/CollisionShape2D

# Number of Resource Spawns
@export var tree_count: int = 60 
@export var stone_count: int = 40 
@export var grain_count: int = 120

# Number of Animal Spawns
@export var chicken_count: int = 20 
@export var wolf_count: int = 12 
@export var lion_count: int = 12 
@export var cow_count: int = 20
@export var sheep_count: int = 20

func _ready() -> void:
	spawn_trees()
	spawn_stones()
	spawn_grains()
	spawn_wolf()
	spawn_lion()
	spawn_cow()
	spawn_sheep()

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

func spawn_grains():
	for i in range(grain_count):
		var grain_instance = grain_scene.instantiate()
		grain_instance.position = get_random_position_in_area_grains() # Assign a random position
		add_child(grain_instance)

func get_random_position_in_area_grains() -> Vector2:
	var shape = grain_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return grain_spawn_area.position + Vector2(x, y)

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

func spawn_wolf():
	for i in range(wolf_count):
		var wolf_instance = wolf_scene.instantiate()
		wolf_instance.position = get_random_position_in_area_wolfs() # Assign a random position
		add_child(wolf_instance)

func get_random_position_in_area_wolfs() -> Vector2:
	var shape = wolf_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return wolf_spawn_area.position + Vector2(x, y)

func spawn_lion():
	for i in range(lion_count):
		var lion_instance = lion_scene.instantiate()
		lion_instance.position = get_random_position_in_area_lions() # Assign a random position
		add_child(lion_instance)

func get_random_position_in_area_lions() -> Vector2:
	var shape = lion_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return lion_spawn_area.position + Vector2(x, y)

func spawn_cow():
	for i in range(cow_count):
		var cow_instance = cow_scene.instantiate()
		cow_instance.position = get_random_position_in_area_cows() # Assign a random position
		add_child(cow_instance)

func get_random_position_in_area_cows() -> Vector2:
	var shape = cow_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return cow_spawn_area.position + Vector2(x, y)

func spawn_sheep():
	for i in range(sheep_count):
		var sheep_instance = sheep_scene.instantiate()
		sheep_instance.position = get_random_position_in_area_sheeps() # Assign a random position
		add_child(sheep_instance)

func get_random_position_in_area_sheeps() -> Vector2:
	var shape = sheep_spawn_shape.shape as RectangleShape2D # Assuming it's a rectangle
	var extents = shape.extents
	# Random position within the extents of the shape
	var x = randf_range(-extents.x, extents.x)
	var y = randf_range(-extents.y, extents.y)
	# Offset by the spawn area’s position
	return sheep_spawn_area.position + Vector2(x, y)
