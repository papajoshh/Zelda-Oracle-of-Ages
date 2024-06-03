extends Node
@export var scenePath:String = "res://assets/scenes/Game/start_new_game_menu.tscn"
@export var signalToConnect:String

func _ready():
	InputManager.connect(signalToConnect, _change_scene)

func _change_scene():
	await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind(scenePath))
