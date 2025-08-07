extends Node2D


func _on_gate_player_entered_gate(body) -> void:
	print("player has entered gate")
	print(body)


func _on_player_player_shot_laser() -> void:
	print("laser from level")


func _on_player_player_shot_grenade() -> void:
	print("grenade from level")
