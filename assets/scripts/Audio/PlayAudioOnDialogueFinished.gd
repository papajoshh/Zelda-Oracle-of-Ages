class_name PlayAudioOnDialogueFinished
extends Node

@export var clip: AudioStream
@export var dialogue_resource: DialogueResource

func _ready():
	DialogueManager.dialogue_ended.connect(PlaySound)

func PlaySound(_resource: DialogueResource):
	if(_resource != dialogue_resource): return
	SoundManager.play_music(clip)
