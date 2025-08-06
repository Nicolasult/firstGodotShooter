extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]

func _ready():
	for i in test_array:
		print(i)
	
func _process(delta):
	$Logo.rotation_degrees += 60 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
		
	print(Input.is_action_pressed("left"))
		
