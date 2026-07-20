class_name State extends Node

@warning_ignore("unused_signal")
signal change_state(stateName: String)

@onready var entity:Node = self.owner


func enter_state() -> void:
	pass


func exit_state() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func input(_event: InputEvent) -> void:
	pass
