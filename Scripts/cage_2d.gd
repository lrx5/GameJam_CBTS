extends Area2D

# Cage Cost
const WOOD_COST = 20
const STONE_COST = 20
var is_built = false
@onready var player = get_node("/root/MainScene/Player")
@onready var rm = get_node("/root/MainScene/ResourceManager")
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var cage_label: Label = $CageLabel

func _ready() -> void:
	cage_label.visible = false
	sprite_2d.visible = false
	set_process(false)

func _process(_delta: float) -> void:
	if is_built == false:
		if Input.is_action_pressed("Interact") and rm.wood >= WOOD_COST and rm.stone >= STONE_COST:
			rm.increase_wood(-20)
			rm.increase_stone(-20)
			build_cage()
			cage_label.visible = false
	if is_built == true:
		sprite_2d.visible = true
		if Input.is_action_pressed("Interact"):
			#put animals here
			pass

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		set_process(true)
	if is_built == false:
		cage_label.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body.name == "Player":
		set_process(false)
	if is_built == false:
		cage_label.visible = false

func build_cage():
	is_built = true
