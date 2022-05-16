extends Spatial


class_name Main

func reset_position():
	$Astro.reset_angle()
	$Astro.transform.origin = $World.get_start_position()

func cast_fireball(pos):
	var player_position = $Astro.transform.origin
	var fb = preload("res://Scenes/Enemies/Fireball.tscn").instance()
	fb.initialise(pos,player_position)
	add_child(fb)
	
	$FireBallGenerator.transform.origin = player_position + Vector3(0,50,0)
	


func _on_World_win():
	reset_position()
