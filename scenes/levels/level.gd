extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Stuff"]

func _ready():
	pass
	
func _process(delta):
	$Logo.rotation_degrees += 60 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
		
	#print(Input.is_action_pressed("left"))

func test_function():
	print("This is a test function")
