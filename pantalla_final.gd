extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mins = int(Global.tiempo_final) / 60
	var secs = int(Global.tiempo_final) % 60
	$Label2.text = str(mins) + " minutos y " + str(secs) + " segundos" if mins > 0 else str(secs) + " segundos" 

func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://menu_principal.tscn")
