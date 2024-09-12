extends Control

@onready var upgrades = get_node("/root/MainScene/Upgrades")
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var resources_1: TextureButton = $TextureButton
@onready var resources_2: TextureButton = $TextureButton2
@onready var resources_3: TextureButton = $TextureButton3
@onready var resources_4: TextureButton = $TextureButton4
@onready var resources_5: TextureButton = $TextureButton5
@onready var punch_1: TextureButton = $TextureButton6
@onready var punch_2: TextureButton = $TextureButton7
@onready var punch_3: TextureButton = $TextureButton8
@onready var punch_4: TextureButton = $TextureButton9
@onready var punch_5: TextureButton = $TextureButton10
@onready var movement_1: TextureButton = $TextureButton11
@onready var movement_2: TextureButton = $TextureButton12
@onready var movement_3: TextureButton = $TextureButton13
@onready var movement_4: TextureButton = $TextureButton14
@onready var movement_5: TextureButton = $TextureButton15


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	upgrades.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		upgrades.visible = !upgrades.visible


func _on_texture_button_pressed() -> void:
	if rm.wood >= 50:
		rm.decrease_wood(50)
		rm.multiplier_wood = 2
		resources_1.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_2_pressed() -> void:
	if rm.stone >= 50:
		rm.decrease_stone(50)
		rm.multiplier_stone = 2
		resources_2.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_3_pressed() -> void:
	if rm.grain >= 50:
		rm.decrease_grain(50)
		rm.multiplier_grain = 2
		resources_3.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_4_pressed() -> void:
	if rm.meat >= 50:
		rm.decrease_meat(50)
		rm.multiplier_meat = 2
		resources_4.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_5_pressed() -> void:
	if rm.wood >= 50 and rm.stone >= 50 and rm.grain >= 50 and rm.meat >= 50:
		rm.decrease_wood(50)
		rm.decrease_stone(50)
		rm.decrease_grain(50)
		rm.decrease_meat(50)
		rm.multiplier_wood = 3
		rm.multiplier_stone = 3
		rm.multiplier_grain = 3
		rm.multiplier_meat = 3
		resources_5.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_6_pressed() -> void:
	pass # Replace with function body.
func _on_texture_button_7_pressed() -> void:
	pass # Replace with function body.
func _on_texture_button_8_pressed() -> void:
	pass # Replace with function body.
func _on_texture_button_9_pressed() -> void:
	pass # Replace with function body.
func _on_texture_button_10_pressed() -> void:
	pass # Replace with function body.

func _on_texture_button_11_pressed() -> void:
	if rm.grain >= 20:
		rm.decrease_grain(20)
		player.speed = 90
		movement_1.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_12_pressed() -> void:
	if rm.meat >= 20:
		rm.decrease_meat(20)
		player.speed = 100
		movement_2.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_13_pressed() -> void:
	if rm.grain >= 40:
		rm.decrease_grain(40)
		player.speed = 110
		movement_3.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_14_pressed() -> void:
	if rm.meat >= 40:
		rm.decrease_meat(40)
		player.speed = 120
		movement_4.disabled = true
	else:
		# Not enough Resources!
		pass
func _on_texture_button_15_pressed() -> void:
	if rm.grain >= 50 and rm.meat >= 50:
		rm.decrease_grain(50)
		rm.decrease_meat(50)
		player.speed = 135
		movement_5.disabled = true
	else:
		# Not enough Resources!
		pass
