extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal player_shot_laser(pos)
signal player_shot_grenade(pos)

func _ready():
	pass

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_just_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		$LaserTimer.start()
		player_shot_laser.emit(selected_laser.global_position)
		
	# grenade shooting input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_grenade = laser_markers[randi() % laser_markers.size()]
		
		can_grenade = false
		$GrenadeTimer.start()
		player_shot_grenade.emit(selected_grenade.global_position)

func _on_laser_timer_timeout() -> void:
	can_laser = true
	
func _on_grenade_timer_timeout() -> void:
	can_grenade = true
