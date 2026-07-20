extends State


func enter_state() -> void:
	#region cambiar sprite
	entity.change_animation("idle_eye_flipped")
	#endregion
	

func physics_update(_delta: float) -> void:
	#region mejorar físicas movimiento lateral
	# !!DARLE UNA VUELTA A ESTO
	entity.velocity.x = entity.direction * entity.SPEED
	#endregion
	
	if entity.is_on_floor():
		change_state.emit("idle")	
	elif Input.is_action_just_pressed("jump") and entity.last_jump != entity.JumpType.DOUBLE_JUMP:
		change_state.emit("double_jump")
