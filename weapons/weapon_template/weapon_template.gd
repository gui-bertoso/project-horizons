extends Node2D
class_name WeaponTemplate

@onready var animation_player: AnimationPlayer = $Animation

func action() -> void:
	animation_player.play("attack")
