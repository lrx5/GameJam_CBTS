extends Control

@onready var upgrades = get_node("/root/MainScene/Upgrades")
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")

# Main Upgrade Buttons
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

# Upgrade Details Labels
@onready var info_r1: Label = $TextureButton/Label
@onready var info_r2: Label = $TextureButton2/Label
@onready var info_r3: Label = $TextureButton3/Label
@onready var info_r4: Label = $TextureButton4/Label
@onready var info_r5: Label = $TextureButton5/Label
@onready var info_p1: Label = $TextureButton6/Label
@onready var info_p2: Label = $TextureButton7/Label
@onready var info_p3: Label = $TextureButton8/Label
@onready var info_p4: Label = $TextureButton9/Label
@onready var info_p5: Label = $TextureButton10/Label
@onready var info_m1: Label = $TextureButton11/Label
@onready var info_m2: Label = $TextureButton12/Label
@onready var info_m3: Label = $TextureButton13/Label
@onready var info_m4: Label = $TextureButton14/Label
@onready var info_m5: Label = $TextureButton15/Label

# Upgrade Bools
var r1_upgraded = false
var r2_upgraded = false
var r3_upgraded = false
var r4_upgraded = false
var r5_upgraded = false
var p1_upgraded = false
var p2_upgraded = false
var p3_upgraded = false
var p4_upgraded = false
var p5_upgraded = false
var m1_upgraded = false
var m2_upgraded = false
var m3_upgraded = false
var m4_upgraded = false
var m5_upgraded = false

# Lock Icons
@onready var lock_1: TextureRect = $TextureRect
@onready var lock_2: TextureRect = $TextureRect2
@onready var lock_3: TextureRect = $TextureRect3
@onready var lock_4: TextureRect = $TextureRect4
@onready var lock_5: TextureRect = $TextureRect5
@onready var lock_6: TextureRect = $TextureRect6
@onready var lock_7: TextureRect = $TextureRect7
@onready var lock_8: TextureRect = $TextureRect8
@onready var lock_9: TextureRect = $TextureRect9
@onready var lock_10: TextureRect = $TextureRect10
@onready var lock_11: TextureRect = $TextureRect11
@onready var lock_12: TextureRect = $TextureRect12





func _ready() -> void:
	upgrades.visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
		upgrades.visible = !upgrades.visible
		player.menu_open = !player.menu_open


#------------- Resource Upgrades -------------#
func _on_texture_button_pressed() -> void:
	if rm.wood >= 50:
		rm.decrease_wood(50)
		rm.multiplier_wood = 2
		resources_1.disabled = true
		r1_upgraded = true
		lock_1.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_2_pressed() -> void:
	if rm.stone >= 50 and r1_upgraded:
		rm.decrease_stone(50)
		rm.multiplier_stone = 2
		resources_2.disabled = true
		r2_upgraded = true
		lock_2.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_3_pressed() -> void:
	if rm.grain >= 50 and r2_upgraded:
		rm.decrease_grain(50)
		rm.multiplier_grain = 2
		resources_3.disabled = true
		r3_upgraded = true
		lock_3.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_4_pressed() -> void:
	if rm.meat >= 50 and r3_upgraded:
		rm.decrease_meat(50)
		rm.multiplier_meat = 2
		resources_4.disabled = true
		r4_upgraded = true
		lock_4.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_5_pressed() -> void:
	if rm.wood >= 100 and rm.stone >= 100 and rm.grain >= 100 and rm.meat >= 100 and r4_upgraded:
		rm.decrease_wood(100)
		rm.decrease_stone(100)
		rm.decrease_grain(100)
		rm.decrease_meat(100)
		rm.multiplier_wood = 4
		rm.multiplier_stone = 4
		rm.multiplier_grain = 4
		rm.multiplier_meat = 4
		resources_5.disabled = true
		r5_upgraded = true
	else:
		# Not enough Resources!
		pass


#------------- Punch Upgrades -------------#
func _on_texture_button_6_pressed() -> void:
	if rm.wood>= 20:
		rm.decrease_wood(20)
		State.punch_timer = 1.7
		punch_1.disabled = true
		p1_upgraded = true
		lock_5.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_7_pressed() -> void:
	if rm.stone >= 30 and p1_upgraded:
		rm.decrease_stone(30)
		State.punch_timer = 1.4
		punch_2.disabled = true
		p2_upgraded = true
		lock_6.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_8_pressed() -> void:
	if rm.wood >= 40 and p2_upgraded:
		rm.decrease_wood(40)
		State.punch_timer = 1.1
		punch_3.disabled = true
		p3_upgraded = true
		lock_7.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_9_pressed() -> void:
	if rm.stone>= 60 and p3_upgraded:
		rm.decrease_stone(60)
		State.punch_timer = 0.8
		punch_4.disabled = true
		p4_upgraded = true
		lock_8.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_10_pressed() -> void:
	if rm.wood >= 80 and rm.stone >= 80 and p4_upgraded:
		rm.decrease_wood(80)
		rm.decrease_stone(80)
		State.punch_timer = 0.5
		punch_5.disabled = true
		p5_upgraded = true
	else:
		# Not enough Resources!
		pass


#------------- Movement Upgrades -------------#
func _on_texture_button_11_pressed() -> void:
	if rm.grain >= 20:
		rm.decrease_grain(20)
		player.speed = 88
		movement_1.disabled = true
		m1_upgraded = true
		lock_9.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_12_pressed() -> void:
	if rm.grain >= 60 and m1_upgraded:
		rm.decrease_grain(60)
		player.speed = 97
		movement_2.disabled = true
		m2_upgraded = true
		lock_10.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_13_pressed() -> void:
	if rm.grain >= 120 and m2_upgraded:
		rm.decrease_grain(120)
		player.speed = 107
		movement_3.disabled = true
		m3_upgraded = true
		lock_11.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_14_pressed() -> void:
	if rm.meat >= 40 and m3_upgraded:
		rm.decrease_meat(40)
		player.speed = 125
		movement_4.disabled = true
		m4_upgraded = true
		lock_12.visible = false
	else:
		# Not enough Resources!
		pass
func _on_texture_button_15_pressed() -> void:
	if rm.grain >= 60 and rm.meat >= 60 and m4_upgraded:
		rm.decrease_grain(60)
		rm.decrease_meat(60)
		player.speed = 145
		movement_5.disabled = true
		m5_upgraded = true
	else:
		# Not enough Resources!
		pass


#------------- On Hover Display Upgrade Details -------------#

func _on_texture_button_mouse_entered() -> void:
	info_r1.visible = true
func _on_texture_button_mouse_exited() -> void:
	info_r1.visible = false
func _on_texture_button_2_mouse_entered() -> void:
	info_r2.visible = true
func _on_texture_button_2_mouse_exited() -> void:
	info_r2.visible = false
func _on_texture_button_3_mouse_entered() -> void:
	info_r3.visible = true
func _on_texture_button_3_mouse_exited() -> void:
	info_r3.visible = false
func _on_texture_button_4_mouse_entered() -> void:
	info_r4.visible = true
func _on_texture_button_4_mouse_exited() -> void:
	info_r4.visible = false
func _on_texture_button_5_mouse_entered() -> void:
	info_r5.visible = true
func _on_texture_button_5_mouse_exited() -> void:
	info_r5.visible = false


func _on_texture_button_6_mouse_entered() -> void:
	info_p1.visible = true
func _on_texture_button_6_mouse_exited() -> void:
	info_p1.visible = false
func _on_texture_button_7_mouse_entered() -> void:
	info_p2.visible = true
func _on_texture_button_7_mouse_exited() -> void:
	info_p2.visible = false
func _on_texture_button_8_mouse_entered() -> void:
	info_p3.visible = true
func _on_texture_button_8_mouse_exited() -> void:
	info_p3.visible = false
func _on_texture_button_9_mouse_entered() -> void:
	info_p4.visible = true
func _on_texture_button_9_mouse_exited() -> void:
	info_p4.visible = false
func _on_texture_button_10_mouse_entered() -> void:
	info_p5.visible = true
func _on_texture_button_10_mouse_exited() -> void:
	info_p5.visible = false



func _on_texture_button_11_mouse_entered() -> void:
	info_m1.visible = true
func _on_texture_button_11_mouse_exited() -> void:
	info_m1.visible = false
func _on_texture_button_12_mouse_entered() -> void:
	info_m2.visible = true
func _on_texture_button_12_mouse_exited() -> void:
	info_m2.visible = false
func _on_texture_button_13_mouse_entered() -> void:
	info_m3.visible = true
func _on_texture_button_13_mouse_exited() -> void:
	info_m3.visible = false
func _on_texture_button_14_mouse_entered() -> void:
	info_m4.visible = true
func _on_texture_button_14_mouse_exited() -> void:
	info_m4.visible = false
func _on_texture_button_15_mouse_entered() -> void:
	info_m5.visible = true
func _on_texture_button_15_mouse_exited() -> void:
	info_m5.visible = false
