extends Area2D

@onready var collision: CollisionShape2D = $Collision

func set_invulnerability(value: bool) -> void:
	collision.disabled = value
