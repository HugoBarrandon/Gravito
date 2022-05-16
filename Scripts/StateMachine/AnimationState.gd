extends State

class_name AnimatedState

var defaultAnimator = "AnimationPlayer"
	
func animation_loop(animation , animator = defaultAnimator):
	if owner.get_node(animator).current_animation != animation:
		owner.get_node(animator).play(animation)

func animation_loop_backward(animation , animator = defaultAnimator):
	if owner.get_node(animator).current_animation != animation:
		owner.get_node(animator).play_backwards(animation)
		
func animation_set_speed(speed , animator = defaultAnimator):
	owner.get_node(animator).playback_speed = speed
	
func animation_skip(time , animator = defaultAnimator):
	owner.get_node(animator).seek(time , true)

func display_sprite(frame , animator = defaultAnimator):
	owner.get_node(animator).stop(true)
	owner.get_node("Sprite").frame = frame

func get_current_animation(animator = defaultAnimator) -> String :
	return owner.get_node(animator).current_animation
