extends KinematicBody

class_name FireBall

var speed = 0
var acceleration = 100
var max_speed = 5000
var old_position : Vector3
var old_position_2 : Vector3

var direction : Vector3

func initialise(start_position, player_position):
	transform.origin = start_position
	direction = player_position + (Vector3.ONE * randf() * 20)
	old_position = transform.origin
	old_position_2= transform.origin

	
func _physics_process(delta):
	move_and_slide(transform.origin.direction_to(direction)*delta*max_speed)
	for i in range(get_slide_count()):
		if get_slide_collision(i).collider is Astro:
			get_slide_collision(i).collider.lose()
		queue_free()
	if(old_position_2-transform.origin).length() < 0.5:
		queue_free()
	old_position_2= old_position
	old_position = transform.origin
