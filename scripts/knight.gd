class_name Knight extends CharacterBody2D

enum JumpType {
	NONE,
	JUMP,
	DOUBLE_JUMP,
}
const SPEED: float = 400.0
const ACELERATION: float = 30.0
const FRICTION: float = 50.0
const JUMP_VELOCITY: float = -1200.0

var direction: float
var is_flipped: bool = false
var last_jump:= JumpType.NONE

@onready var state_machine = $StateMachine
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

#region borrar
@onready var estados_tarjeta: Label = $"Estados (borrar)"
#endregion


func _ready() -> void:
	# Se inicia una vez se cargan todos los nodos
	state_machine.start()


func _process(_delta: float) -> void:	
	#region borrar
	estados_tarjeta.text = state_machine.current_state.name + " velocity: " + str(velocity.x)
	#endregion
	pass


func _physics_process(delta: float) -> void:
		velocity += get_gravity() * delta
		
		direction = Input.get_axis("move_left", "move_right")
		if direction == 1.0:
			is_flipped = false
		elif direction == -1.0:
			is_flipped = true
		
		move_and_slide()


func change_animation(new_animation) -> void:
	if sprite.animation != new_animation:
		sprite.play(new_animation)
