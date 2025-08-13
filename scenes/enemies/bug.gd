extends CharacterBody2D

var active: bool = false
var vulnerable: bool = true
var player_near: bool = false
var speed: int = 300

func _process(_delta):
	var direction = (Globals.player_pos - position).normalized()
	velocity = direction * speed
	
	if active:
		move_and_slide()
		look_at(Globals.player_pos)

func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_near = true
	$AnimatedSprite2D.play("attack")

func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_near = false
	$AnimatedSprite2D.stop()

func _on_notice_area_body_entered(_body: Node2D) -> void:
	active = true
	$AnimatedSprite2D.play("walk")

func _on_notice_area_body_exited(_body: Node2D) -> void:
	active = false
	$AnimatedSprite2D.stop()

func _on_animated_sprite_2d_animation_finished() -> void:
	if player_near:
		Globals.health -= 10
