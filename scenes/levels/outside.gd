extends LevelParent


func _on_gate_player_entered_gate(_body) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.8, 0.8), 1).set_trans(Tween.TRANS_QUAD)

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
