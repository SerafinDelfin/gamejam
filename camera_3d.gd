extends Camera3D

var positions : Array = [Vector3(-9.313, 7.964, 7.964), Vector3(-30.069, 8.723, -16.812), Vector3(-11.674, 8.021, 0.368), Vector3(-100.041, 8.281, 2.633), Vector3(-45.403, 8.281, 23.852), Vector3(-100.8, 11.246, -0.242), Vector3(-49.46, 5.401, 10.163), Vector3(-67.94, 5.401, -30.68)]
var rotations : Array = [Vector3(-30.2, -38.3, 0), Vector3(-47.2, -130.8, 0), Vector3(-34.9, 90, 0), Vector3(-14.9, -79, 0), Vector3(-29.4, -58, 0), Vector3(-32, 90, 0), Vector3(-10, -243, 0), Vector3(-10, -236.7, 0)]  # Rotaciones en grados


func _on_oficina_body_entered(_body: Node3D) -> void:
	set_cam_position(0)

func _on_baño_body_entered(_body: Node3D) -> void:
	set_cam_position(1)

func _on_pasillo_1_body_entered(_body: Node3D) -> void:
	set_cam_position(2)

func _on_pasillo_2_body_entered(_body: Node3D) -> void:
	set_cam_position(3)
	
func _on_cocina_body_entered(_body: Node3D) -> void:
	set_cam_position(4)
	
func _on_escaleras_body_entered(_body: Node3D) -> void:
	set_cam_position(5)
	
func _on_muertos_body_entered(_body: Node3D) -> void:
	set_cam_position(6)
	
func _on_salon_body_entered(_body: Node3D) -> void:
	set_cam_position(7)
	
func set_cam_position(num : int):
	self.global_position = positions[num]
	self.rotation_degrees = rotations[num]
