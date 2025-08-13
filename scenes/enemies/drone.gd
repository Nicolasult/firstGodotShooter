extends CharacterBody2D

var active: bool = true
var vulnerable: bool = true
var explosion_active: bool = false

var speed: int = 0
var max_speed: int = 650
var health: int = 40

func _ready():
	$Explosion.hide()

func hit():
	if vulnerable:
		health -= 10
		$DroneImage.material.set_shader_parameter("progress", 1)
		vulnerable = false
		$HitTimer.start()
	if health <= 0:
		$AnimationPlayer.play("explosion")
		explosion_active = true

func _process(delta):
	if active and health > 0:
		look_at(Globals.player_pos)
		var direction = (Globals.player_pos - position).normalized()
		velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			$AnimationPlayer.play("explosion")
			explosion_active = true
			
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity") 
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < 400 
			if in_range and "hit" in target:
				target.hit()
				
func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true
	var tween = create_tween()
	tween.tween_property(self, "speed", max_speed, 5)

func _on_hit_timer_timeout() -> void:
	$DroneImage.material.set_shader_parameter("progress", 0)
	vulnerable = true
