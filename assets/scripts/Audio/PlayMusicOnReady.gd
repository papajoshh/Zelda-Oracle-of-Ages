class_name PlayMusicOnReady

extends Node

@export var clip: AudioStream

func _ready():
	SoundManager.play_music(clip)
