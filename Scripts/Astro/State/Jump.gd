extends OnAir

var jump_height : float = 0
var look_at : Vector3

func enter(f=true):
	.enter()
	owner.save_angle()
	var look_at_tmp = owner.get_camera_global_angle().basis.z
	look_at = look_at_tmp.round()
	if(abs(look_at.x) == abs(look_at.z) and abs(look_at.x) == 1):
		if look_at_tmp.x>look_at_tmp.z:
			look_at.z=0
		else:
			look_at.x=0
	elif(abs(look_at.y) == abs(look_at.z) and abs(look_at.z) == 1):
		if look_at_tmp.y>look_at_tmp.z:
			look_at.z=0
		else:
			look_at.y=0
	elif(abs(look_at.x) == abs(look_at.y) and abs(look_at.y) == 1):
		
		if look_at_tmp.x>look_at_tmp.y:
			look_at.y=0
		else:
			look_at.x=0
	if touch_ground() and not owner.fallen:
		velocity += -owner.gravity_direction.normalized()*JUMPFORCE
		jump_height = JUMPFORCE
	apply_velocity()

func update(delta):
	.update(delta)
	if velocity.dot(owner.gravity_direction) >-1 and velocity.dot(owner.gravity_direction) <1 and not owner.fallen:
		owner.change_gravity(look_at)
	elif velocity.length() > 0.5 and velocity.dot(owner.gravity_direction)>-10 and velocity.dot(owner.gravity_direction)<10 and velocity.y!=-1.5 and not owner.fallen:
		owner.player_rotation_x(look_at)

func exit():
	owner.fallen=false
