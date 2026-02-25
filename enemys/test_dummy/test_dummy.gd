extends EnemyTemplate
class_name TestDummy

func update_animation() -> void:
	if not animation_player.is_playing():
		animation_player.play("idle")

func _on_hitbox_area_entered(area: Area2D) -> void:
	if Globals.player.global_position.x < global_position.x:
		$Body/Sprite.flip_h = false
	else:
		$Body/Sprite.flip_h = true
	animation_player.play("hit")
	
	var floating_damage := damage_floating_text_scene.instantiate()
	floating_damage.set_data(-1 * area.damage)
	floating_damage.global_position = float_damage_spawn.global_position
	get_tree().current_scene.add_child(floating_damage)
