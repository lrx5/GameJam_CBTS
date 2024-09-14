extends Area2D

# Cage Cost
const WOOD_COST = 50
const STONE_COST = 50
var is_built = false
var in_cage = false
var cage_is_not_full = true
var cage_1_free = true
var cage_2_free = true
var cage_3_free = true
var cage_4_free = true
var animal_to_spawn
var do_not_spawn = false

# Nodes
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var cage_label: Label = $CageLabel
@onready var delete_1 = get_node("/root/MainScene/Hud/Control/Delete1")
@onready var delete_2 = get_node("/root/MainScene/Hud/Control/Delete2")
@onready var delete_3 = get_node("/root/MainScene/Hud/Control/Delete3")
@onready var delete_4 = get_node("/root/MainScene/Hud/Control/Delete4")
@onready var button1 = get_node("/root/MainScene/Hud/Control/Button")
@onready var button2 = get_node("/root/MainScene/Hud/Control/Button2")
@onready var button3 = get_node("/root/MainScene/Hud/Control/Button3")
@onready var button4 = get_node("/root/MainScene/Hud/Control/Button4")

func _ready() -> void:
	cage_label.visible = false
	sprite_2d.visible = false
	set_process(false)
	button1.connect("pressed", Callable(self, "_on_button_pressed"))
	button2.connect("pressed", Callable(self, "_on_button_2_pressed"))
	button3.connect("pressed", Callable(self, "_on_button_3_pressed"))
	button4.connect("pressed", Callable(self, "_on_button_4_pressed"))

func _process(_delta: float) -> void:
	if is_built == false:
		if Input.is_action_pressed("Interact") and rm.wood >= WOOD_COST and rm.stone >= STONE_COST:
			rm.decrease_wood(50)
			rm.decrease_stone(50)
			build_cage()
			cage_label.visible = false
	if is_built == true:
		sprite_2d.visible = true

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		set_process(true)
		player.in_cage = true
	if is_built == false:
		cage_label.visible = true
	if is_built:
		in_cage = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		set_process(false)
		player.in_cage = false
	if is_built == false:
		cage_label.visible = false
	if is_built:
		in_cage = false

func build_cage():
	is_built = true


func _on_button_pressed() -> void:
	if in_cage and cage_is_not_full == true:
		spawn_animal_in_cage(rm.slot_1)
		# Remove Portrait
		rm.slot_1 = "Nothing"
		rm.slot_1_empty = true
		rm.portrait_one.texture = null
		delete_1.visible = false
		player.slots_available = true

func _on_button_2_pressed() -> void:
	if in_cage and cage_is_not_full == true:
		spawn_animal_in_cage(rm.slot_2)
		# Remove Portrait
		rm.slot_2 = "Nothing"
		rm.slot_2_empty = true
		rm.portrait_two.texture = null
		delete_2.visible = false
		player.slots_available = true
		
func _on_button_3_pressed() -> void:
	if in_cage and cage_is_not_full == true:
		spawn_animal_in_cage(rm.slot_3)
		# Remove Portrait
		rm.slot_3 = "Nothing"
		rm.slot_3_empty = true
		rm.portrait_three.texture = null
		delete_3.visible = false
		player.slots_available = true
func _on_button_4_pressed() -> void:
	if in_cage and cage_is_not_full == true:
		spawn_animal_in_cage(rm.slot_4)
		# Remove Portrait
		rm.slot_4 = "Nothing"
		rm.slot_4_empty = true
		rm.portrait_four.texture = null
		delete_4.visible = false
		player.slots_available = true

func spawn_animal_in_cage(animal: String):
	var _animal = animal
	if cage_1_free:
		check_animal_type(_animal)
		if !do_not_spawn:
			var spawned_animal = animal_to_spawn.instantiate()
			spawned_animal.position = global_position - Vector2(310, 151)
			add_child(spawned_animal)
			cage_1_free = false

	elif cage_2_free:
		check_animal_type(_animal)
		if !do_not_spawn:
			var spawned_animal = animal_to_spawn.instantiate()
			spawned_animal.position = global_position - Vector2(280, 151)
			add_child(spawned_animal)
			cage_2_free = false
		
	elif cage_3_free:
		check_animal_type(_animal)
		if !do_not_spawn:
			var spawned_animal = animal_to_spawn.instantiate()
			spawned_animal.position = global_position - Vector2(310, 121)
			add_child(spawned_animal)
			cage_3_free = false
	elif cage_4_free:
		check_animal_type(_animal)
		if !do_not_spawn:
			var spawned_animal = animal_to_spawn.instantiate()
			spawned_animal.position = global_position - Vector2(280, 121)
			add_child(spawned_animal)
			cage_4_free = false

func check_animal_type(animal: String):
	if animal == "Chicken":
		do_not_spawn = false
		animal_to_spawn = preload("res://Scenes/Static/chicken_static.tscn")
	elif animal == "Wolf":
		do_not_spawn = false
		animal_to_spawn = preload("res://Scenes/Static/wolf_static.tscn")
	elif animal == "Lion":
		do_not_spawn = false
		animal_to_spawn = preload("res://Scenes/Static/lion_static.tscn")
	elif animal == "Cow":
		do_not_spawn = false
		animal_to_spawn = preload("res://Scenes/Static/cow_static.tscn")
	elif animal == "Sheep":
		do_not_spawn = false
		animal_to_spawn = preload("res://Scenes/Static/sheep_static.tscn")
	else:
		do_not_spawn = true

func _on_top_left_area_exited(area: Area2D) -> void:
	cage_1_free = true
	cage_is_not_full = true
func _on_top_right_area_exited(area: Area2D) -> void:
	cage_2_free = true
	cage_is_not_full = true
func _on_bottom_left_area_exited(area: Area2D) -> void:
	cage_3_free = true
	cage_is_not_full = true
func _on_bottom_right_area_exited(area: Area2D) -> void:
	cage_4_free = true
	cage_is_not_full = true


func _on_top_left_area_entered(area: Area2D) -> void:
	cage_1_free = false
	check_if_cage_not_full()
func _on_top_right_area_entered(area: Area2D) -> void:
	cage_2_free = false
	check_if_cage_not_full()
func _on_bottom_left_area_entered(area: Area2D) -> void:
	cage_3_free = false
	check_if_cage_not_full()
func _on_bottom_right_area_entered(area: Area2D) -> void:
	cage_4_free = false
	check_if_cage_not_full()

func check_if_cage_not_full():
	if cage_1_free == false and cage_2_free == false and cage_3_free == false and cage_4_free == false:
		cage_is_not_full = false
	return cage_is_not_full
