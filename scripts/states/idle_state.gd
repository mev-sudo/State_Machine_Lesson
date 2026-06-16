extends State

#States it can move to.
@export var jump_state: State
@export var move_state: State

func enter() -> void:
	#Super calls top level state.gd class enter function.
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('ui_accept') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('ui_left') or Input.is_action_just_pressed('ui_right'):
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	return null
