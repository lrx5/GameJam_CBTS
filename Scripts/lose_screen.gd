extends CanvasLayer

func _on_texture_button_pressed() -> void:
	reset_states()
	get_tree().reload_current_scene()

func reset_states():
	State.punch_timer = 2
