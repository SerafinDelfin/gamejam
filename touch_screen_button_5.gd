extends TouchScreenButton

var move_vector : Vector2

func _ready() -> void:
	get_parent().get_parent().get_parent().get_node("items_manager").connect("puls_button", Callable(self, "hid"))
	get_parent().get_parent().get_parent().get_node("items_manager").connect("h_puls_button", Callable(self, "sh"))

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if self.is_pressed():
			if !event.position.distance_to(position + Vector2(200, 200)) > 300:
				move_vector = calculate_move_vector(event.position)
				$"../TouchScreenButton6".global_position = event.position - Vector2(200, 200)*0.64

func calculate_move_vector(event_position):
	var texture_center = position + Vector2(200, 200)
	return (event_position - texture_center).normalized()


func _on_released() -> void:
	move_vector = Vector2.ZERO
	$"../TouchScreenButton6".position = Vector2(200, 632)

func hid():
	$"../TouchScreenButton".visible = true
	
func sh():
	$"../TouchScreenButton".visible = false
