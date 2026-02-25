extends Node2D
class_name WeaponTemplate

@export var action_sounds_list: Array[AudioStreamWAV] = []

@onready var animation_player: AnimationPlayer = $Animation
@onready var action_sound: AudioStreamPlayer2D = $ActionSound

func _ready() -> void:
	set_random_action_sound()

func action() -> void:
	if not animation_player.is_playing():
		animation_player.play("attack")

func _on_action_sound_finished() -> void:
	set_random_action_sound()

func set_random_action_sound() -> void:
	action_sound.stream = action_sounds_list[randi_range(0, action_sounds_list.size()-1)]
