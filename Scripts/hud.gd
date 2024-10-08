extends Control

var game_timer = 100

@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var lose_screen = get_node("/root/MainScene/LoseScreen")

@onready var delete_1: TextureButton = $Delete1
@onready var delete_2: TextureButton = $Delete2
@onready var delete_3: TextureButton = $Delete3
@onready var delete_4: TextureButton = $Delete4
@onready var game_timer_label: Label = $GameTimer

func _ready() -> void:
	delete_1.visible = false
	delete_2.visible = false
	delete_3.visible = false
	delete_4.visible = false
	
func _on_delete_1_pressed() -> void:
	rm.slot_1 = ""
	rm.slot_1_empty = true
	rm.portrait_one.texture = null
	delete_1.visible = false
	player.slots_available = true

func _on_delete_2_pressed() -> void:
	rm.slot_2 = ""
	rm.slot_2_empty = true
	rm.portrait_two.texture = null
	delete_2.visible = false
	player.slots_available = true


func _on_delete_3_pressed() -> void:
	rm.slot_3 = ""
	rm.slot_3_empty = true
	rm.portrait_three.texture = null
	delete_3.visible = false
	player.slots_available = true


func _on_delete_4_pressed() -> void:
	rm.slot_4 = ""
	rm.slot_4_empty = true
	rm.portrait_four.texture = null
	delete_4.visible = false
	player.slots_available = true


func _on_flood_timer_timeout() -> void:
	game_timer -= 1
	update_game_timer()
	if game_timer == 0:
		lose_screen.visible = true
	

func update_game_timer() -> void:
		game_timer_label.text = "Time left: " + str(game_timer)
