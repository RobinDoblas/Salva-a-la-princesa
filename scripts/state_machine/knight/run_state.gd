extends State

var previous_direction: float


func enter_state() -> void:
	#region BORRAR
	entity.sprite.flip_h = false #BORRAR
	#endregion
	previous_direction = entity.direction
	play_run_animation()


func physics_update(_delta: float) -> void:
	if previous_direction != entity.direction:
		if abs(entity.velocity.x) >= entity.SPEED: 
			play_turn_animation()
		else:
			play_run_animation()
		
		previous_direction = entity.direction
		
	entity.velocity = entity.velocity.move_toward(Vector2(entity.direction, 0) * entity.SPEED, entity.ACELERATION)
	
	if not entity.is_on_floor():
		change_state.emit("fall")
	
	elif entity.direction == 0.0:
		change_state.emit("idle")


func input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"): 
		change_state.emit("jump")


func _on_animated_sprite_2d_animation_finished() -> void:
	#region BORRAR
	entity.sprite.flip_h = false 
	#endregion
	play_run_animation()


func play_run_animation() -> void:
	if entity.is_flipped:
		entity.change_animation("run_flipped")
	else:
		entity.change_animation("run")


func play_turn_animation() -> void:
	#region CAMBIAR SPRITE
	if entity.is_flipped:
				entity.change_animation("turn") #CAMBIAR ANIMACIÓN
	else:
		entity.sprite.flip_h = true #BORRAR
		entity.change_animation("turn") #CAMBIAR ANIMACIÓN
	#endregion
