extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

func _ready():
	pass

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_just_pressed("primary action") and can_laser:
		print("Shoot laser")
		can_laser = false
		$LaserTimer.start()
		
	# grenade shooting input
	if Input.is_action_just_pressed("secondary action") and can_grenade:
		print("Shoot grenade")
		can_grenade = false
		$GrenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_laser = true
	
func _on_grenade_timer_timeout() -> void:
	can_grenade = true
