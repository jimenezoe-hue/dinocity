extends Node3D

@export var pool: ObjectPool
@export var spawn_distance: float = 40.0
@export var spawn_interval: float = 1.5

var timer: float = 0.0
var player: Node3D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if not player or not pool:
		return
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0
		_spawn_obstacle()

func _spawn_obstacle() -> void:
	var obj = pool.get_obstacle()
	if obj:
		var lane = randi() % 3
		obj.position = Vector3((lane - 1) * 2.5, 0.5, player.position.z - spawn_distance)
		obj.visible = true
