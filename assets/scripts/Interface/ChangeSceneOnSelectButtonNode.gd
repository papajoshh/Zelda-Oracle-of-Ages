class_name ChangeSceneOnSelectButtonNode

extends Control

@export var scenePath:String = "res://assets/scenes/Game/start_new_game_menu.tscn"
@export var button: Button

var focusedFirstTime = false

func _ready():
	button.pressed.connect(change_scene)
	
func change_scene():
		await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind(scenePath))
