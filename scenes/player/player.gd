extends CharacterBody2D

func _ready():
	pass

func _process(_delta):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_just_pressed("primary action"):
		print("Shoot laser")
		
	# grenade shooting input
	if Input.is_action_just_pressed("secondary action"):
		print("Shoot grenade")
	
