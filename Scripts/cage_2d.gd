extends Area2D

#
const WOOD_COST = 20
const STONE_COST = 20
var is_built = false
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_2d: Sprite2D = $Sprite2D
var unbuilt_cage = preload("res://Sprites/Test/Test_Cage_Unbuilt.PNG")
var built_cage = preload("res://Sprites/Cage.png")

func _ready() -> void:
	sprite_2d.texture = unbuilt_cage
	set_process(false)

func _process(_delta: float) -> void:
	if is_built == false:
		if Input.is_action_pressed("Interact") and rm.wood >= WOOD_COST and rm.stone >= STONE_COST:
			rm.increase_wood(-20)
			rm.increase_stone(-20)
			build_cage()
	if is_built == true:
		sprite_2d.texture = built_cage

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		@warning_ignore("narrowing_conversion")
		self_modulate(0.5)
		set_process(true)

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		self_modulate(1)
		set_process(false)

func self_modulate(value: float):
	sprite_2d.modulate.r = value

func build_cage():
	is_built = true
