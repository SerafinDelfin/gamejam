extends Node3D

signal puls_button
signal h_puls_button

var items : Array = [false, false, false, false, false]

var good_pulsable : Array = [false, false, false, false, false]
var bad_pulsable : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if bad_pulsable:
			$"../TimeManager".restart.emit(0)
		if good_pulsable[0]:
			if !items[0]:
				label_action("Has encontrado una llave en el lavabo")
				items[0] = true
			else:
				label_action("No hay nada dentro del lavabo, solo oscuridad")
		if good_pulsable[1]:
			if !items[0] and !items[1]:
				label_action("Necesitas una llave para abrir el armario")
			elif items[0] and !items[1]:
				label_action("Has recogido unas pinzas del armario")
				items[1] = true
			elif items[1]:
				label_action("No hay nada dentro del armario, solo oscuridad")
		if good_pulsable[2]:
			if !items[1] and !items[2]:
				label_action("Parece haber un objeto al fondo de la papelera")
			elif items[1] and !items[2]:
				label_action("Has recogido un medallón de corazón con tus pinzas")
				items[2] = true
			elif items[2]:
				print(items[2])
				label_action("La papelera está vacía")
		if good_pulsable[3]:
			if !items[2] and !items[3]:
				label_action("Hay un libro con una hendidura")
			elif items[2] and !items[3]:
				label_action("Al colocar el colgante en el libro se ha abierto \n Hay una llave dentro")
				items[3] = true
			elif items[3]:
				label_action("Solo hay ruido")
		if good_pulsable[4]:
			if !items[3] and !items[4]:
				label_action("Está cerrada a cal y canto")
			elif items[3] and !items[4]:
				label_action("... \n Hay un corazón en la caja...")
				items[4] = true
			elif items[4]:
				label_action("Solo hay oscuridad... \n Mucha... \n Mucha más... \n Oscuridad")
		

func reset():
	for i in items.size():
		items[i] = false
	bad_pulsable = false
	for i in good_pulsable.size():
		good_pulsable[i] = false

func _on_bad_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	bad_pulsable = true

func _on_bad_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	bad_pulsable = false

func _on_good_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	good_pulsable[0] = true
	
func _on_good_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	good_pulsable[0] = false
	
func _on_good_2_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	good_pulsable[1] = true
	
func _on_good_2_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	good_pulsable[1] = false
	

func _on_good_3_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	good_pulsable[2] = true
	

func _on_good_3_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	good_pulsable[2] = false
	

func _on_good_4_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	good_pulsable[3] = true
	

func _on_good_4_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	good_pulsable[3] = false
	

func _on_good_5_body_entered(_body: Node3D) -> void:
	puls_button.emit()
	good_pulsable[4] = true
	

func _on_good_5_body_exited(_body: Node3D) -> void:
	h_puls_button.emit()
	good_pulsable[4] = false
	
func label_action(inside : String):
	if $AnimationPlayer2.is_playing():
		$AnimationPlayer.stop()
	$Label.text = inside
	$AnimationPlayer.play("Aparecer")

func osc_action():
	label_action("Una sombra aparece... \n Todo está... \n Oscuro... \n Muy oscuro")
	$AnimationPlayer2.play("oscurecer")

func _on_time_manager_restart(_value: int) -> void:
	osc_action()
	reset()

func _on_final_body_entered(_body: Node3D) -> void:
	if !items[4]:
		$"../TimeManager".restart.emit(0)
	else:
		Global.tiempo_final = $"../TimeManager".get_node("Timer").wait_time - $"../TimeManager".get_node("Timer").time_left
		$Final/AnimationPlayer.play("new_animation")
		await $Final/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://pantalla_final.tscn")
