extends Node

# Starting Resource Values
var wood = 0
var stone = 0
var grain = 0
var meat = 0

# Resource Multipliers
var multiplier_wood = 1
var multiplier_stone= 1
var multiplier_grain = 1
var multiplier_meat = 1

# Portrait Slots
var slot_1_empty = true
var slot_2_empty = true
var slot_3_empty = true
var slot_4_empty = true
var slot_1
var slot_2
var slot_3
var slot_4

# Resource Labels at Hud
@onready var wood_label: Label = %WoodLabel
@onready var stone_label: Label = %StoneLabel
@onready var grain_label: Label = %GrainLabel
@onready var meat_label: Label = %MeatLabel

# Preload Animal Portraits
var chicken_texture = preload("res://Sprites/Test/Test_Chicken.png")
var wolf_texture = preload("res://Sprites/Test/Test_Wolf.PNG")
var lion_texture = preload("res://Sprites/Test/Test_Lion.PNG")
var cow_texture = preload("res://Sprites/Test/Test_Cow.PNG")
var sheep_texture = preload("res://Sprites/Test/Test_Sheep.PNG")

# Access TextureRects & Delete Buttons
@onready var player = get_node("/root/MainScene/Player")
@onready var portrait_one = get_node("/root/MainScene/Hud/Control/PortraitOne/AnimalOne")
@onready var portrait_two = get_node("/root/MainScene/Hud/Control/PortraitTwo/AnimalTwo")
@onready var portrait_three = get_node("/root/MainScene/Hud/Control/PortraitThree/AnimalThree")
@onready var portrait_four = get_node("/root/MainScene/Hud/Control/PortraitFour/AnimalFour")
@onready var delete_1 = get_node("/root/MainScene/Hud/Control/Delete1")
@onready var delete_2 = get_node("/root/MainScene/Hud/Control/Delete2")
@onready var delete_3 = get_node("/root/MainScene/Hud/Control/Delete3")
@onready var delete_4 = get_node("/root/MainScene/Hud/Control/Delete4")

func _ready() -> void:
	update_wood_label()
	update_stone_label()
	update_grain_label()

# Change Resource Values
func increase_wood(amount: int) -> void:
	wood += amount * multiplier_wood
	update_wood_label()
func increase_stone(amount: int) -> void:
	stone += amount * multiplier_stone
	update_stone_label()
func increase_grain(amount: int) -> void:
	grain += amount * multiplier_grain
	update_grain_label()
func decrease_wood(amount: int) -> void:
	wood -= amount 
	update_wood_label()
func decrease_stone(amount: int) -> void:
	stone -= amount
	update_stone_label()
func decrease_grain(amount: int) -> void:
	grain -= amount
	update_grain_label()

func capture_animal(animal: String) -> void:
	if animal == "Chicken":
		check_slots(animal)
		update_portrait_ui(animal)
	elif animal == "Wolf":
		check_slots(animal)
		update_portrait_ui(animal)
	elif animal == "Lion":
		check_slots(animal)
		update_portrait_ui(animal)
	elif animal == "Cow":
		check_slots(animal)
		update_portrait_ui(animal)
	elif animal == "Sheep":
		check_slots(animal)
		update_portrait_ui(animal)
# Update the label text with the current wood amount
func update_wood_label() -> void:
	if wood < 10:
		wood_label.text = "00" + str(wood)
	elif wood < 100:
		wood_label.text = "0" + str(wood)
	elif wood > 999:
		wood_label.text = "999"
	else:
		wood_label.text = str(wood)
func update_stone_label() -> void:
	if stone < 10:
		stone_label.text = "00" + str(stone)
	elif wood < 100:
		stone_label.text = "0" + str(stone)
	elif wood > 999:
		stone_label.text = "999"
	else:
		stone_label.text = str(stone)
func update_grain_label() -> void:
	if grain < 10:
		grain_label.text = "00" + str(grain)
	elif grain < 100:
		grain_label.text = "0" + str(grain)
	elif wood > 999:
		grain_label.text = "999"
	else:
		grain_label.text = str(grain)

func check_slots(animal: String) -> void:
		if slot_1_empty:
			slot_1 = animal
			slot_1_empty = false
			delete_1.visible = true
		elif slot_2_empty:
			slot_2 = animal
			slot_2_empty = false
			delete_2.visible = true
		elif slot_3_empty:
			slot_3 = animal
			slot_3_empty = false
			delete_3.visible = true
		elif slot_4_empty:
			slot_4 = animal
			slot_4_empty = false
			delete_4.visible = true
		if !slot_1_empty and !slot_2_empty and !slot_3_empty and !slot_4_empty:
			player.slots_available = false
		else:
			player.slots_available = true
func update_portrait_ui(animal: String) -> void:
	# Portrait 1
	if slot_1 == "Chicken":
		portrait_one.texture = chicken_texture
	if slot_1 == "Wolf":
		portrait_one.texture = wolf_texture
	if slot_1 == "Lion":
		portrait_one.texture = lion_texture
	if slot_1 == "Cow":
		portrait_one.texture = cow_texture
	if slot_1 == "Sheep":
		portrait_one.texture = sheep_texture
	
	# Portrait 2
	if slot_2 == "Chicken":
		portrait_two.texture = chicken_texture
	if slot_2 == "Wolf":
		portrait_two.texture = wolf_texture
	if slot_2 == "Lion":
		portrait_two.texture = lion_texture
	if slot_2 == "Cow":
		portrait_two.texture = cow_texture
	if slot_2 == "Sheep":
		portrait_two.texture = sheep_texture

	# Portrait 3
	if slot_3 == "Chicken":
		portrait_three.texture = chicken_texture
	if slot_3 == "Wolf":
		portrait_three.texture = wolf_texture
	if slot_3 == "Lion":
		portrait_three.texture = lion_texture
	if slot_3 == "Cow":
		portrait_three.texture = cow_texture
	if slot_3 == "Sheep":
		portrait_three.texture = sheep_texture

	# Portrait 4
	if slot_4 == "Chicken":
		portrait_four.texture = chicken_texture
	if slot_4 == "Wolf":
		portrait_four.texture = wolf_texture
	if slot_4 == "Lion":
		portrait_four.texture = lion_texture
	if slot_4 == "Cow":
		portrait_four.texture = cow_texture
	if slot_4 == "Sheep":
		portrait_four.texture = sheep_texture
