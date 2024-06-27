extends Camera2D

var tween: Tween

func move(target_position:Vector2, tween_duration:float):
	if tween:
		tween.kill()
	tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", target_position, tween_duration).set_trans(Tween.TRANS_SINE)
	InputManager.checkInput = false
	await tween.finished
	InputManager.checkInput = true
