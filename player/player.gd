extends CharacterBody2D
class_name Player

@onready var stats = $Stats
@onready var dash_particles_emitter = $VFX/DashParticles
@onready var hitbox: Area2D = $Hitbox

@export var dev_mode: bool = false

var is_moving: bool = false
var is_dashing: bool = false

var dash_leftover_time: float = 0.0

var direction: Vector2
var dash_direction: Vector2

var can_dash: bool = true

var used_dash_charges: int = 0

var dash_countdown: float = 0.0

func _ready() -> void:
	Globals.player = self
	verify_dev_mode()

func _process(delta: float) -> void:
	update_countdowns(delta)
	action_behavior()

func _physics_process(delta: float) -> void:
	movement_behavior(delta)
	move_and_slide()

func movement_behavior(delta: float) -> void:
	if is_dashing:
		dash_leftover_time -= delta
		if dash_leftover_time <= 0.0:
			dash_leftover_time = 0.0
			dash_complete()
		else:
			velocity = dash_direction * stats.dash_velocity
		return
		
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = input_direction.normalized()
	if direction:
		velocity = direction * stats.move_speed
		is_moving = true
	else:
		velocity.x = move_toward(velocity.x, 0, stats.move_speed)
		velocity.y = move_toward(velocity.y, 0, stats.move_speed)
		is_moving = false

func action_behavior() -> void:
	if Input.is_action_just_pressed("action_dash"):
		if not is_dashing and direction != Vector2.ZERO and can_dash:
			is_dashing = true
			dash_direction = direction
			dash_leftover_time = stats.dash_duration
			if stats.dash_invulnerability:
				hitbox.set_invulnerability(true)

func update_countdowns(delta: float) -> void:
	if dash_countdown > 0.0:
		dash_countdown -= delta
		if dash_countdown <= 0.0:
			dash_countdown = 0.0
			used_dash_charges = 0
			can_dash = true
			print("countdown finished")

func verify_dev_mode() -> void:
	if dev_mode:
		stats.enable_dev_mode()

func dash_complete() -> void:
	is_dashing = false
	used_dash_charges += 1
	if used_dash_charges < stats.dash_charges:
		print("can dash")
		can_dash = true
	else:
		print("not can dash")
		can_dash = false
		dash_countdown = stats.dash_cooldown

func _on_hitbox_area_entered(area: Area2D) -> void:
	stats.update_stat("health", "decrease", area.damage)
