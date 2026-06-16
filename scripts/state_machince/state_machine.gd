class_name State_Machine extends Node

@export var initial_state: State

var active_state: State

func _ready() -> void:
	#loops through all the children states
	for child_state: State in get_children():
		child_state.switch_state.connect(change_state)
	change_state(initial_state)


func _process(delta: float) -> void:
	if active_state:
		active_state.update(delta)

func _physics_process(delta: float) -> void:
	if active_state:
		active_state.phyics_update(delta)


func change_state (new_state: State) -> void:
	if new_state == active_state:
		return
	
	if active_state:
		active_state.exit_state()
		
	active_state = new_state
	
	if active_state:
		active_state.enter_state()
		
	
