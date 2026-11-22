extends CharacterBody3D

@export var speed: float = 8.0
@export var jump_velocity: float = 7.0
@export var lane_distance: float = 2.5

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var current_lane: int = 1
var state: String = "running"
var invincible: bool = false
var speed_mult: float = 1.0

signal died
signal collected(type: String)

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
		state = "jumping"
	else:
		state = "running"

	velocity.z = -speed * speed_mult

	var target_x := (current_lane - 1) * lane_distance
	position.x = lerpf(position.x, target_x, 0.18)

	move_and_slide()

func jump() -> void:
	if is_on_floor():
		velocity.y = jump_velocity

func change_lane(dir: int) -> void:
	current_lane = clampi(current_lane + dir, 0, 2)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_up"):
		jump()
	if event.is_action_pressed("ui_left"):
		change_lane(-1)
	if event.is_action_pressed("ui_right"):
		change_lane(1)

	# Debug keys
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_F1:
				invincible = !invincible
				print("Invincible: ", invincible)
			KEY_F2:
				speed_mult = 2.0
			KEY_F3:
				speed_mult = 1.0

func hit() -> void:
	if invincible:
		return
	died.emit()
	print("Game Over")
