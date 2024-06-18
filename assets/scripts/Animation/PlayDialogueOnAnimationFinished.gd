@tool
class_name PlayDialogueOnAnimationFinished

extends Node

var animationPlayer:AnimationPlayer
@export var animationToCheck: StringName
@export var dialogue_resource: DialogueResource
@export var dialogue_node: String = "start"
@export var balloonRoute = "res://assets/scenes/Dialogues/balloon.tscn"

func _ready():
	animationPlayer = get_parent()
	animationPlayer.animation_finished.connect(PlayDialogue)

func PlayDialogue(animation:StringName):
	if(animationPlayer == null): return
	if(animationToCheck != animation): return
	var balloon: Node = load(balloonRoute).instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource, dialogue_node)

func _get_configuration_warnings():
	var warnings = []
	var parent = get_parent()
	if !(parent is AnimationPlayer):
		warnings.append('PlayDialogueOnAnimationFinished needs a parent that is AnimationPlayer')
	return warnings
