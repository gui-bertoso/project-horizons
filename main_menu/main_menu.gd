extends Control


func _ready() -> void:
	$AudioStreamPlayer.play()

func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
