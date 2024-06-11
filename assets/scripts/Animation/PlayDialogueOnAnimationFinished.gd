class_name PlayDialogueOnAnimationFinished

extends Node

@export var animationPlayer:AnimationPlayer
@export var animationToCheck: StringName
@export var dialogue_resource: DialogueResource
@export var dialogue_node: String = "start"
@export var balloonRoute = "res://assets/scenes/Dialogues/balloon.tscn"

func _ready():
	animationPlayer.animation_finished.connect(PlayDialogue)

func PlayDialogue(animation:StringName):
	if(animationToCheck != animation): return
	var balloon: Node = load(balloonRoute).instantiate()
	get_tree().current_scene.add_child(balloon)
	DialogueManager
	balloon.start(dialogue_resource, dialogue_node)
