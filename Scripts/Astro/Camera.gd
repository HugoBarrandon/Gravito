extends Spatial

export(float) var MOUSE_SENSITIVITY = 0.005
export(float) var MIN_ZOOM = -3
export(float) var MAX_ZOOM = -20
export(float) var ZOOM_SPEED = 0.5

var mouselocked : bool = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if Input.is_action_just_pressed("LockMouse"):
		if mouselocked:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			mouselocked = false
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			mouselocked = true
	elif (event is InputEventMouseMotion ) and mouselocked:
		rotate_object_local(Vector3.UP, -event.relative.x * MOUSE_SENSITIVITY)
	elif get_camera_stick() != 0 and mouselocked:
		rotate_object_local(Vector3.UP, get_camera_stick()*0.05)
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP && $CameraZoom.transform.origin.z < MIN_ZOOM:
			$CameraZoom.transform.origin.z += ZOOM_SPEED
		elif event.button_index == BUTTON_WHEEL_DOWN && $CameraZoom.transform.origin.z > MAX_ZOOM:
			$CameraZoom.transform.origin.z -= ZOOM_SPEED

func get_camera_stick():
	return Input.get_action_strength("Camera_Left") - Input.get_action_strength("Camera_Right")
