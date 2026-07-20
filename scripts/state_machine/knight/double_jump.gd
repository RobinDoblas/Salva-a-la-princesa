extends Jump

func enter_state() -> void:
	entity.last_jump = entity.JumpType.DOUBLE_JUMP
	entity.velocity.y = entity.JUMP_VELOCITY
	#region cambiar sprite
	entity.change_animation("idle_eye")
	#endregion
