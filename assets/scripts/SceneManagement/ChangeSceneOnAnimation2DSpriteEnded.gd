@tool
class_name ChangeSceneOnAnimation2DSpriteEnded
extends Node

var animationSprite
@export var animationToCheck: StringName
@export var scenePath: String = "res://assets/scenes/Game/main_menu.tscn"

func _ready():
	animationSprite = get_parent()
	animationSprite.animation_finished.connect(ChangeScene)

func ChangeScene():
	if(animationSprite == null): return
	if(animationSprite.animation == animationToCheck):
		TransitionScreen.FadeInOut(1, Color.WHITE, SceneManager.change_scene.bind(scenePath))

func _get_configuration_warnings():
	var warnings = []
	var parent = get_parent()
	if !(parent is AnimatedSprite2D):
		warnings.append('ChangeSceneOnAnimation2DSpriteEnded needs a parent that is AnimatedSprite2D')
	return warnings
