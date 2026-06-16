extends State

@export var idle_state: State
@export var move_state: State

@onready var animation = $"../../AnimatedSprite2D"

func enter_state () -> void:
	animation.play("roll")


func _on_animated_sprite_2d_animation_finished() -> void:
	switch_state.emit(idle_state)
