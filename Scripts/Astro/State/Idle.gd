extends OnGround

func enter():
	animation_loop("Idle")
	.enter()

func handle_input(_event):
	if Vector3(get_x_input(),0,get_z_input()):
		emit_signal("finished","Walk")
	.handle_input(_event)

