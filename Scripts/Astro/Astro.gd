extends KinematicBody

class_name Astro

signal fall

export(int) var SPEED = 500

export(float) var GRAVITY_STRENGHT = 0.5
var velocity : Vector3 = Vector3(0,0,0)
var fallen = false
var gravity_direction : Vector3 = Vector3.DOWN
var old_angle : Vector3


func apply_row_velocity(v):
# warning-ignore:return_value_discarded
	move_and_slide_with_snap(v, Vector3.DOWN*2,gravity_direction, 0.05, 4)

func get_camera_angle():
	return $CameraPivot.transform
func get_camera_global_angle():
	return $CameraPivot.global_transform

func player_rotation(speed):
	var v = get_camera_angle().basis.z
	$ArmatureAstronaut.rotation.y = lerp_angle($ArmatureAstronaut.rotation.y, atan2(v.x, v.z),speed)

func player_rotation_x(new_gravity):
	var v = gravity_direction.cross(new_gravity)
	if v:
		rotate(v.normalized(),PI/10)
	
func reset_angle():
	rotation = Vector3.ZERO
	gravity_direction = Vector3.DOWN
	$StateMachine.change_state("Idle")
	
	rotation = Vector3(0,0,0)

func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform

func change_gravity(new_gravity):
	var v = gravity_direction.cross(new_gravity)
	rotation = old_angle
	if v:
		rotate(v, PI/2)
		gravity_direction = new_gravity

func save_angle():
	old_angle = rotation

func lose():
	emit_signal("fall")
