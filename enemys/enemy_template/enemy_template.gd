extends CharacterBody2D
class_name EnemyTemplate

@export var move_speed: float = 120.0
@onready var animation_player: AnimationPlayer = $Body/AnimationPlayer

var player_reference: Player
@onready var detection_distance: float = 200.0

var current_state: String = ""

func _process(delta: float) -> void:
	update_state(delta)
	update_animation()

func _physics_process(_delta: float) -> void:
	apply_state()
	move_and_slide()

func update_state(_delta: float) -> void:
	pass

func apply_state() -> void:
	pass

func update_animation() -> void:
	pass
