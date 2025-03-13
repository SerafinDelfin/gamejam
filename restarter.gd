extends Node3D

var main_position : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_position = $"../CharacterBody3D".global_position
	get_parent().get_parent().get_node("TimeManager").connect("reseteado", Callable(self, "again"))

func again():
	$"../CharacterBody3D".global_position = main_position
