extends CharacterBody3D

@export var speed: float = 8.0
@export var jump_velocity: float = 6.5
@export var lane_distance: float = 2.5

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var current_lane: int = 1  # 0 = left, 1 = center, 2 = right

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Auto-run forward
	velocity.z = -speed

	# Smooth lane change
	var target_x := (current_lane - 1) * lane_distance
	position.x = lerpf(position.x, target_x, 0.15)

	move_and_slide()

func jump() -> void:
	if is_on_floor():
		velocity.y = jump_velocity

func change_lane(direction: int) -> void:
	current_lane = clampi(current_lane + direction, 0, 2)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_up"):
		jump()
	if event.is_action_pressed("ui_left"):
		change_lane(-1)
	if event.is_action_pressed("ui_right"):
		change_lane(1)
