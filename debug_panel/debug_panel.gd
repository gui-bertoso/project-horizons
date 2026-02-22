extends Control

@export var data_0: Label = null
@export var data_1: Label = null
@export var data_2: Label = null
@export var data_3: Label = null
@export var data_4: Label = null
@export var data_5: Label = null
@export var data_6: Label = null
@export var data_7: Label = null
@export var data_8: Label = null

var update_delay: float = 0.2
var update_countdown: float = 0.0

func _process(delta: float) -> void:
	update_data(delta)
	update_countdown -= delta
	if update_countdown <= 0.0:
		update_countdown = update_delay

func update_data(delta: float) -> void:
	data_0.text = str(Engine.get_frames_per_second())
	data_1.text = str(delta)
	data_2.text = str(Globals.player.global_position)
	data_3.text = str(Globals.player.velocity)
	data_4.text = str(Globals.player.is_dashing)
	data_5.text = str(Globals.player.used_dash_charges)
	data_6.text = str(Globals.player.stats.dash_charges)
	data_7.text = str(Globals.player.dash_countdown)
	data_8.text = str(Globals.player.dash_leftover_time)
