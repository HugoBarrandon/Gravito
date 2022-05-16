extends AnimatedState

class_name AstroMouvement

export(float) var JUMPFORCE = 40
export(float) var SMOOTH_SPEED : float = 5.0

var velocity : Vector3 = Vector3(0,0,0)
var forward : Vector3 = Vector3(0, 0 , 0)

func get_x_input():
	var dirx = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	return dirx
	#return 0 #work in progress
	
func get_z_input():
	var diry = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	return diry

func apply_velocity(fact = 1):
	velocity += owner.gravity_direction * fact
	owner.move_and_slide(velocity , -owner.gravity_direction)

func touch_ground() -> bool :
	return owner.is_on_floor()

func touch_ceiling() -> bool :
	return owner.is_on_ceiling()
	
func touch_wall() -> bool :
	return owner.is_on_wall()
