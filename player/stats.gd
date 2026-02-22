extends Node

var base_move_speed: float = 100.0
var extra_move_speed: float = 0.0

var base_health: float = 100.0
var extra_health: float = 0.0

var base_dash_charges: int = 0
var base_dash_velocity: float = 400.0
var base_dash_duration: float = 0.0
var base_dash_cooldown: float = 5

var extra_dash_charges: int = 0
var extra_dash_velocity: float = 0.0
var extra_dash_duration: float = 0.0
var extra_dash_cooldown: float = 0.0

var move_speed: float = 0.0

var health: float = 0.0

var dash_charges: int = 0
var dash_velocity: float = 0.0
var dash_duration: float = 0.0
var dash_cooldown: float = 0.0

var dash_invulnerability: bool = false

func _ready() -> void:
	set_stats()

func set_stats() -> void:
	health = base_health + extra_health
	
	move_speed = base_move_speed + extra_move_speed
	
	dash_charges = base_dash_charges + extra_dash_charges
	dash_cooldown = base_dash_cooldown - extra_dash_cooldown
	dash_velocity = base_dash_velocity + extra_dash_velocity
	dash_duration = base_dash_duration + extra_dash_duration

func enable_dev_mode() -> void:
	extra_move_speed = 350.0
	
	extra_dash_charges = 5
	extra_dash_velocity = 600.0
	extra_dash_duration = 0.12
	extra_dash_cooldown = 1.3
	
	dash_invulnerability = true
	
	set_stats()
