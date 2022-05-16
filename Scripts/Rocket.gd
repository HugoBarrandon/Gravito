extends StaticBody

class_name Rocket

signal win

func _on_Area_body_entered(body):
	if body is Astro:
		emit_signal("win")
