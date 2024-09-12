extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area is Area2D and area.name == "CameraBeam":
		area.queue_free()
