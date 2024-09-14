extends Area2D

var chickens = 0
var wolves = 0
var bears = 0
var boars = 0
var goats = 0
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var delete_1 = get_node("/root/MainScene/Hud/Control/Delete1")
@onready var delete_2 = get_node("/root/MainScene/Hud/Control/Delete2")
@onready var delete_3 = get_node("/root/MainScene/Hud/Control/Delete3")
@onready var delete_4 = get_node("/root/MainScene/Hud/Control/Delete4")
@onready var win_screen = get_node("/root/MainScene/WinScreen")
@onready var chickens_saved = get_node("/root/MainScene/WinScreen/Chicken")
@onready var wolves_saved = get_node("/root/MainScene/WinScreen/Wolf")
@onready var bears_saved = get_node("/root/MainScene/WinScreen/Bear")
@onready var boars_saved = get_node("/root/MainScene/WinScreen/Boar")
@onready var goats_saved = get_node("/root/MainScene/WinScreen/Goat")
@onready var vessel: Sprite2D = $Sprite2D
@onready var boat_label: Label = $BoatLabel
@onready var boat_info: Label = $BoatInfo
@onready var boat_info_timer: Timer = $BoatInfoTimer
@onready var boat_info_2: Label = $BoatInfo2


var boat_is_built = false

func _ready() -> void:
	set_process(false)
	vessel.visible = false
	boat_label.visible = false
	boat_info.visible = false
	boat_info_2.visible = false

func _process(delta: float) -> void:
	if boat_is_built == true and Input.is_action_just_pressed("Interact"):
		game_over_win()
	if boat_is_built == false and Input.is_action_just_pressed("Interact"):
		if rm.wood >= 500 and rm.stone >= 400 and rm.grain >= 300 and rm.meat >= 200:
			rm.decrease_wood(500)
			rm.decrease_stone(400)
			rm.decrease_grain(300)
			rm.decrease_meat(200)
			boat_is_built = true
			vessel.visible = true
			boat_label.visible = false
			boat_info.visible = true
			boat_info_2.visible = true
			boat_info_timer.start()

func _on_button_pressed() -> void:
	if boat_is_built and State.state_at_boat:
		check_animal_type(rm.slot_1)
		# Remove Portrait
		rm.slot_1 = "Nothing"
		rm.slot_1_empty = true
		rm.portrait_one.texture = null
		delete_1.visible = false
		player.slots_available = true

func _on_button_2_pressed() -> void:
	if boat_is_built and State.state_at_boat:
		check_animal_type(rm.slot_2)
		# Remove Portrait
		rm.slot_2 = "Nothing"
		rm.slot_2_empty = true
		rm.portrait_two.texture = null
		delete_2.visible = false
		player.slots_available = true


func _on_button_3_pressed() -> void:
	if boat_is_built and State.state_at_boat:
		check_animal_type(rm.slot_3)
		# Remove Portrait
		rm.slot_3 = "Nothing"
		rm.slot_3_empty = true
		rm.portrait_three.texture = null
		delete_3.visible = false
		player.slots_available = true


func _on_button_4_pressed() -> void:
	if boat_is_built and State.state_at_boat:
		check_animal_type(rm.slot_4)
		# Remove Portrait
		rm.slot_4 = "Nothing"
		rm.slot_4_empty = true
		rm.portrait_four.texture = null
		delete_4.visible = false
		player.slots_available = true

func check_animal_type(animal: String):
	if animal == "Chicken":
		chickens += 1
	elif animal == "Wolf":
		wolves += 1
	elif animal == "Lion":
		bears += 1
	elif animal == "Cow":
		boars += 1
	elif animal == "Sheep":
		goats += 1
	else:
		pass


func _on_body_entered(body: Node2D) -> void:
	State.state_at_boat = true
	set_process(true)
	if !boat_is_built:
		boat_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	State.state_at_boat = false
	set_process(false)
	boat_label.visible = false

func game_over_win():
	chickens_saved.text = "CHICKEN: " + str(chickens) 
	wolves_saved.text = "WOLF: " + str(wolves)
	bears_saved.text = "BEAR: " + str(bears)
	boars_saved.text = "BOAR: " + str(boars)
	goats_saved.text = "GOAT: " + str(goats)
	win_screen.visible = true


func _on_boat_info_timer_timeout() -> void:
	boat_info.visible = false
