extends KinematicBody

var current_speed = 0
var acceleration = 0.5
var max_speed = 10

func _unhandled_input(_event):
	if Input.is_action_pressed("Rotation_Plon_Right"):
		current_speed=min(current_speed + acceleration, max_speed)
	if Input.is_action_just_released("Rotation_Plon_Right"):
		current_speed = 0
		
func _physics_process(delta):
	rotate(transform.basis.y,current_speed*delta)
