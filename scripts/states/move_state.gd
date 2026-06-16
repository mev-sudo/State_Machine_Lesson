extends State

@export var idle_state: State
@export var jump_state: State


@onready var timer = $"../../Timer"
@onready var animation = $"../../AnimatedSprite2D"
@onready var player = $"../.."

func enter_state () -> void:
	animation.play("run")
	

func update (_delta: float) -> void:
	if Input.get_axis("ui_left", "ui_right") == 0:
		switch_state.emit(idle_state)
	elif Input.is_action_just_pressed("ui_accept"):
		switch_state.emit(jump_state)
	if Input.is_action_pressed("ui_boost"):
		player.boost(500)
		timer.start()


func _on_timer_timeout() -> void:
	player.boost(200)
