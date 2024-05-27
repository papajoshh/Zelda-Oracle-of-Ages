class_name PlaySoundOnFocusNode

extends Control

@export var cursorAudio:AudioStream
@export var button: Button
@export var ignoreFirstFocus: bool

var focusedFirstTime = false

func _ready():
	button.focus_entered.connect(play_sound)
	
func play_sound():
	if(ignoreFirstFocus and !focusedFirstTime):
		focusedFirstTime = true
		return
	SoundManager.play_ui_sound(cursorAudio)
