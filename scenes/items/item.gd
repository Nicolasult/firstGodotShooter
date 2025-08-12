extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "grenade", "health"]
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250)

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color(0.486, 0.702, 0.963)
	if type == "grenade":
		$Sprite2D.modulate = Color(0.782, 0.362, 0.904)
	if type == "health":
		$Sprite2D.modulate = Color(0.306, 0.678, 0.127)
		
	# tween
	var target_pos = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.3).from(Vector2(0, 0))

func _process(delta: float) -> void:
	rotation += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	if type == "health":
		Globals.health += 10
	if type == "laser":
		Globals.laser_amount += 5
	if type == "grenade":
		Globals.grenade_amount += 2
	queue_free()
