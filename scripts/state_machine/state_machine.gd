class_name StateMachine extends Node

@export var initial_state: State

var current_state: State:
	set(new_value):
		current_state = new_value
		#print("Changed to ", current_state.name)


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func _input(event: InputEvent) -> void:
	if current_state:
		current_state.input(event)


func _on_change_state(new_state_name: String) -> void:
	new_state_name = new_state_name.replace("_", " ").capitalize()
	
	if current_state:
		if new_state_name == current_state.name:
			return
		current_state.exit_state()
		
	current_state = get_node(new_state_name)
	
	if current_state:
		current_state.enter_state()


func start() -> void:
	for child_state: State in get_children():
		child_state.change_state.connect(_on_change_state)
	
	_on_change_state(initial_state.name)
