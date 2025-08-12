extends Area2D

var rotation_speed: int = 4
var available_options = ["laser", "laser", "laser", "grenade", "health"]
var type = "health"#available_options[randi()%len(available_options)]

func _ready():
	if type == "laser":
		$Sprite2D.modulate = Color(0.486, 0.702, 0.963)
	if type == "grenade":
		$Sprite2D.modulate = Color(0.782, 0.362, 0.904)
	if type == "health":
		$Sprite2D.modulate = Color(0.306, 0.678, 0.127)

func _process(delta: float) -> void:
	rotation += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	body.add_item(type)
	if type == "health":
		Globals.health += 10
	queue_free()
