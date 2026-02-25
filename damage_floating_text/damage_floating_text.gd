extends Label
class_name DamageFloatingDamage

@export var increase_color: Color
@export var decrease_color: Color

func _ready() -> void:
	$Timer.start(0.5)

func set_data(value: int) -> void:
	text = str(value)
	if value < 0:
		modulate = decrease_color
	else:
		modulate = increase_color

func _process(_delta: float) -> void:
	global_position.y -= 0.1

func _on_timer_timeout() -> void:
	queue_free()
