@tool
class_name PlayAnimationOnDialogueFinished

extends Node

var animationPlayer:AnimatedSprite2D
@export var dialogue_resource: DialogueResource
@export var animationName: String

func _ready():
	animationPlayer = get_parent()
	DialogueManager.dialogue_ended.connect(PlayAnimation)

func PlayAnimation(_resource: DialogueResource):
	if(_resource != dialogue_resource): return
	animationPlayer.play(animationName)

func _get_configuration_warnings():
	var warnings = []
	var parent = get_parent()
	if !(parent is AnimatedSprite2D):
		warnings.append('PlayAnimationOnDialogueFinished needs a parent that is AnimatedSprite2D')
	return warnings
