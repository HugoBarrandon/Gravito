extends Spatial

class_name FireBallGenerator

func _ready():
	randomize()


func _on_Timer_timeout():
	var mob_spawn_location = get_node("Path/PathFollow")
	# And give it a random offset.
	mob_spawn_location.unit_offset = randf()
	get_parent().cast_fireball(mob_spawn_location.global_transform.origin)
