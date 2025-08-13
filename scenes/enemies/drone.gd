extends CharacterBody2D

var active: bool = true
var vulnerable: bool = true

var speed: int = 400
var health: int = 40

func _process(_delta):
	if active:
		look_at(Globals.player_pos)
		var direction = (Globals.player_pos - position).normalized()
		velocity = direction * speed
		move_and_slide()
	
func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$HitTimer.start()
	if health <= 0:
		queue_free()
	
func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true


func _on_hit_timer_timeout() -> void:
	vulnerable = true
