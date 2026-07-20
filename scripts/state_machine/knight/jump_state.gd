class_name Jump extends State


func enter_state() -> void:
	entity.last_jump = entity.JumpType.JUMP
	entity.velocity.y = entity.JUMP_VELOCITY
	#region cambiar sprite
	entity.change_animation("idle_eye")
	#endregion
	#region mejorar físicas movimiento lateral
	# !!DARLE UNA VUELTA A ESTO
	entity.velocity = entity.velocity.move_toward(Vector2(entity.direction, 0) * entity.SPEED, entity.ACELERATION)
	#endregion

func physics_update(_delta: float) -> void:	
	if entity.velocity.y > 0:
		change_state.emit("fall")

func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and entity.last_jump != entity.JumpType.DOUBLE_JUMP:
		change_state.emit("double_jump")
