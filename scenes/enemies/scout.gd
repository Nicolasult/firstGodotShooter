extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true

signal laser(pos, direction)

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions/Marker2D.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserCooldown.start()


func _on_attack_area_body_entered(body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true
