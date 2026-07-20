extends State


func enter_state() -> void:
	entity.last_jump = entity.JumpType.NONE
	if not entity.is_flipped:
		entity.change_animation("idle")
	else:
		entity.change_animation("idle_flipped")


func physics_update(_delta: float) -> void:
	entity.velocity = entity.velocity.move_toward(Vector2.ZERO, entity.FRICTION)
	
	if not entity.is_on_floor():
		change_state.emit("fall")
	elif Input.get_axis("move_left", "move_right") != 0:
		change_state.emit("run")


func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"): 
		change_state.emit("jump")
