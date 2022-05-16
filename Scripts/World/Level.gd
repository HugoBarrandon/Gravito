extends Spatial

class_name Level

signal win

func get_start_position():
	return $StartPosition.transform.origin



func _on_Rocket_win():
	emit_signal("win")
