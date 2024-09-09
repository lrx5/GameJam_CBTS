extends Node

# Starting Resource Values
var wood = 0
var stone = 0
var grain = 0
var meat = 0

# Resource Labels at Hud
@onready var wood_label: Label = %WoodLabel
@onready var stone_label: Label = %StoneLabel
@onready var grain_label: Label = %GrainLabel
@onready var meat_label: Label = %MeatLabel

func _ready() -> void:
	update_wood_label()
	update_stone_label()
	update_grain_label()

# Change Resource Values
func increase_wood(amount: int) -> void:
	wood += amount
	update_wood_label()
func increase_stone(amount: int) -> void:
	stone += amount
	update_stone_label()
func increase_grain(amount: int) -> void:
	grain += amount
	update_grain_label()

# Update the label text with the current wood amount
func update_wood_label() -> void:
	wood_label.text = "Wood: " + str(wood)
func update_stone_label() -> void:
	stone_label.text = "Stone: " + str(stone)
func update_grain_label() -> void:
	grain_label.text = "Grain: " + str(grain)
