extends AstroMouvement

class_name OnAir

var sum_delta

func enter():
	sum_delta = 0
	velocity = Vector3.ZERO

func compute_gravity() :
	velocity += owner.GRAVITY_STRENGHT * owner.gravity_direction

func update(delta):
	sum_delta += delta
	if sum_delta > 4:
		owner.lose()
	
	if touch_ceiling():
		velocity.y = 0
	if touch_ground():
		if get_z_input():
			emit_signal("finished" , "Walk")
		else:
			emit_signal("finished" , "Idle")
	else:
		compute_gravity()
		apply_velocity()
