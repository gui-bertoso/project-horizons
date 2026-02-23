extends EnemyTemplate

func update_state(_delta: float) -> void:
	match current_state:
		"":
			current_state = "idle"
		"idle":
			if Globals.player.global_position.distance_to(global_position) <= detection_distance:
				player_reference = Globals.player
				current_state = "chase"
		"chase":
			if Globals.player.global_position.distance_to(global_position) > detection_distance:
				player_reference = null
				current_state = "idle"

func apply_state() -> void:
	match current_state:
		"":
			current_state = "idle"
		"idle":
			velocity.x = move_toward(velocity.x, 0.0, move_speed)
			velocity.y = move_toward(velocity.y, 0.0, move_speed)
		"chase":
			var direction: Vector2 = (player_reference.global_position - global_position).normalized()
			if direction:
				velocity = direction * move_speed
			

func update_animation() -> void:
	match current_state:
		"":
			pass
		"idle":
			animation_player.play("idle")
		"chase":
			animation_player.play("walk")
		"death":
			animation_player.play("death")
			await animation_player.animation_finished
			queue_free()
