class_name PlaySoundOnSelectButtonNode

extends Control

@export var audio:AudioStream
@export var button: Button

func _ready():
	button.pressed.connect(play_sound)
	
func play_sound():
	SoundManager.play_ui_sound(audio)
