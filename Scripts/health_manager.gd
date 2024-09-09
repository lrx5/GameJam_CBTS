extends Node

var player_health = 5

func change_health(amount: int) -> void:
	player_health += amount
	update_health_ui()

func update_health_ui():
	pass
