extends Button

@export var cursorAudio:AudioStream

func _on_focus_entered():
	SoundManager.play_ui_sound(cursorAudio)
