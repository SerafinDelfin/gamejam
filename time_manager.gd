extends Control

signal restart(value : int)
signal reseteado

var w_time = 60
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_start()

func _process(_delta: float) -> void:
	calc_time()

func time_start() -> void:
	$Timer.wait_time = w_time
	$Timer.start()
	
func time_add(time) -> void:
	w_time += time

func calc_time() -> void:
	var mins = int($Timer.time_left) / 60
	var secs = int($Timer.time_left) % 60
	$Label.text = str(mins) + ":" + str(secs) if mins > 0 else str(secs)

func _on_timer_timeout() -> void:
	restart.emit(1)

func _on_restart(value : int) -> void:
	reseteado.emit()
	match value:
		0:
			time_start()
		1:
			time_add(10)
			time_start()
