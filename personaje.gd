extends Node3D


func _on_character_body_3d_moverse() -> void:
	$AnimationPlayer.play("centro")
	print("something")
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.playing = true


func _on_character_body_3d_quieto() -> void:
	$AnimationPlayer.play("idle")
	$AudioStreamPlayer.playing = false
