extends CSGMesh3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var target = $"../Node3D".get_child(0)
	var distance = global_position.distance_to(target.global_position)

	# Interpolar la opacidad según la distancia
	var alpha = clamp(1.0 - (distance / 132.0), 0.0, 1.0)

	# Aplicar al rectángulo
	$ColorRect.modulate.a = alpha
