class_name PlayAnimationOnDialogueFinished

extends Node

@export var animationPlayer:AnimatedSprite2D
@export var dialogue_resource: DialogueResource
@export var animationName: String
func _ready():
	DialogueManager.dialogue_ended.connect(PlayAnimation)

func PlayAnimation(_resource: DialogueResource):
	if(_resource != dialogue_resource): return
	animationPlayer.play(animationName)
