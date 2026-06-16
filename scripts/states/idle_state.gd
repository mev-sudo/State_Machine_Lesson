extends State

@export var move_state: State
@export var jump_state: State

@onready var animation = $"../../AnimatedSprite2D"

func enter_state () -> void:
	animation.play("idle")
	

func update (_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") != Vector2.ZERO:
		switch_state.emit(move_state)
	elif Input.is_action_just_pressed("ui_accept"):
		switch_state.emit(jump_state)
