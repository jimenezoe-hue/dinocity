class_name ObjectPool
extends Node

@export var obstacle_scene: PackedScene
@export var item_scene: PackedScene
@export var pool_size: int = 20

var obstacle_pool: Array[Node3D] = []
var item_pool: Array[Node3D] = []

func _ready() -> void:
	_prefill_pool()

func _prefill_pool() -> void:
	if obstacle_scene:
		for i in pool_size:
			var obj = obstacle_scene.instantiate()
			obj.visible = false
			obj.set_physics_process(false)
			add_child(obj)
			obstacle_pool.append(obj)
	if item_scene:
		for i in pool_size:
			var obj = item_scene.instantiate()
			obj.visible = false
			add_child(obj)
			item_pool.append(obj)

func get_obstacle() -> Node3D:
	return _get_from_pool(obstacle_pool, obstacle_scene)

func get_item() -> Node3D:
	return _get_from_pool(item_pool, item_scene)

func _get_from_pool(pool: Array, scene: PackedScene) -> Node3D:
	for obj in pool:
		if not obj.visible:
			obj.visible = true
			obj.set_physics_process(true)
			return obj
	# Si no hay disponibles, crear uno nuevo
	if scene:
		var obj = scene.instantiate()
		add_child(obj)
		pool.append(obj)
		return obj
	return null

func return_object(obj: Node3D) -> void:
	obj.visible = false
	obj.set_physics_process(false)
	obj.position = Vector3.ZERO
