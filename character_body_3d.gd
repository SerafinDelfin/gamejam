extends CharacterBody3D

@export var SPEED = 5.0
@export var GRAVITY = 9.8

signal quieto
signal moverse

func _physics_process(delta: float) -> void:
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y -= GRAVITY * delta  # Se resta porque Y va hacia arriba en Godot

	# Obtener la cámara activa
	var camara = get_viewport().get_camera_3d()
	if camara:
		# Obtener la dirección de los ejes de la cámara
		var adelante = camara.global_transform.basis.z  # Dirección hacia adelante
		var derecha = camara.global_transform.basis.x  # Dirección hacia la derecha

		# Obtener entrada del jugador
		var input_dir := Vector2(
		$"../Control/TouchScreenButton5".move_vector.x,
		$"../Control/TouchScreenButton5".move_vector.y
).limit_length(1.0)
		
		# Convertir la entrada en movimiento relativo a la cámara
		var direction = (derecha * input_dir.x + adelante * input_dir.y).normalized()
		if direction != Vector3.ZERO:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			var angulo_y = atan2(direction.z, -direction.x)
			rotation.y = angulo_y
			moverse.emit()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			quieto.emit()
		
	move_and_slide()
