extends CharacterBody2D

var active: bool = false
var speed: int = 3000

func _ready():
	$NavigationAgent2D.target_position = Globals.player_pos

func _physics_process(delta: float) -> void:
	var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
	var direction: Vector2 = (next_path_pos - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func _on_notice_area_body_entered(body: Node2D) -> void:
	active = true

func _on_notice_area_body_exited(body: Node2D) -> void:
	active = false
