extends Node3D


func _on_character_body_3d_moverse() -> void:
	$AnimationPlayer.play("centro")


func _on_character_body_3d_quieto() -> void:
	$AnimationPlayer.play("idle")
