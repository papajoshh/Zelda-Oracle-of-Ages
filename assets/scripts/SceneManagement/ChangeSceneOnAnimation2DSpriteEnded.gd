class_name ChangeSceneOnAnimation2DSpriteEnded
extends Node

@export var animationSprite: AnimatedSprite2D
@export var animationToCheck: StringName
@export var scenePath: String = "res://assets/scenes/Game/main_menu.tscn"

func _ready():
	animationSprite.animation_finished.connect(ChangeScene)

func ChangeScene():
	if(animationSprite.animation == animationToCheck):
		TransitionScreen.FadeInOut(1, Color.WHITE, SceneManager.change_scene.bind(scenePath))
