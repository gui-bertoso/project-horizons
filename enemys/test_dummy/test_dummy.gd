extends EnemyTemplate
class_name TestDummy

func update_animation() -> void:
	if not animation_player.is_playing():
		animation_player.play("idle")

func _on_hitbox_area_entered(_area: Area2D) -> void:
	if Globals.player.global_position.x < global_position.x:
		scale = Vector2(1, 1)
	else:
		scale = Vector2(-1, 1)
	animation_player.play("hit")
	await get_tree().create_timer(0.26).timeout
	scale = Vector2(1, 1)
