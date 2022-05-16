extends OnGround

func enter():
	animation_set_speed(2)
	animation_loop("Walk")

func update(delta):
	var v : Vector3 = owner.get_camera_global_angle().basis.z
	v = v.normalized()
	var movement_vector : Vector3 = Vector3.ZERO
	movement_vector += -get_x_input()*v.cross(-owner.gravity_direction)
	movement_vector += get_z_input()*v
	
	if not movement_vector :
		emit_signal("finished" , "Idle")
	else :
		velocity = -movement_vector * owner.SPEED*delta
		owner.player_rotation( delta * SMOOTH_SPEED)
		apply_velocity(9)
	.update(delta)

func handle_input(_event):
	.handle_input(_event)

func exit():
	animation_set_speed(1)
