extends Node

var score: int = 0
var coupons: int = 0
var running: bool = true

func _ready() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.died.connect(_on_player_died)
		player.collected.connect(_on_collected)

func _process(delta: float) -> void:
	if running:
		score += int(delta * 10)

func add_score(amount: int) -> void:
	score += amount

func add_coupon() -> void:
	coupons += 1

func _on_player_died() -> void:
	running = false
	print("Score final: ", score, " | Cupones: ", coupons)
	get_tree().reload_current_scene()

func _on_collected(type: String) -> void:
	if type == "coupon":
		add_coupon()
	else:
		add_score(20)
