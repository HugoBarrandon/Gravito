extends AstroMouvement

class_name OnGround

func compute_gravity() :
	velocity += owner.GRAVITY_STRENGHT * owner.gravity_direction
	velocity += owner.get_floor_velocity()
func enter():
	velocity = Vector3.ZERO
	compute_gravity()
	apply_velocity()

func handle_input(event : InputEvent):
	if event.is_action_pressed("Jump"):
		emit_signal("finished" , "Jump")
		return
	
func update(_delta):
	if not touch_ground():
		owner.fallen = true
		emit_signal("finished" , "Jump")
	else:
		compute_gravity()
		apply_velocity()
