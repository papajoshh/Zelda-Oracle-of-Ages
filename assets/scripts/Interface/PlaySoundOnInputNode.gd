class_name PlaySoundOnInputNode

extends Node
@export var audio:AudioStream
@export var signalToConnect:String

func _ready():
	InputManager.connect(signalToConnect, play_sound)
	
func play_sound():
	SoundManager.play_ui_sound(audio)
