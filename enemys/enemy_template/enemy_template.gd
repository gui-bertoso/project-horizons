extends CharacterBody2D
class_name EnemyTemplate

@export var move_speed: float = 120.0
@onready var animation_player: AnimationPlayer = $Body/AnimationPlayer

@onready var float_damage_spawn: Marker2D = $FloatDamageSpawn

@onready var damage_floating_text_scene: PackedScene = preload("res://damage_floating_text/damage_floating_text.tscn")

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

func _on_hitbox_area_entered(area: Area2D) -> void:
	var floating_damage := damage_floating_text_scene.instantiate()
	floating_damage.set_data(-1 * area.damage)
	floating_damage.global_position = float_damage_spawn.global_position
	get_tree().current_scene.add_child(floating_damage)
	
