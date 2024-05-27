extends Control

@export var button: Button

func _ready():
	button.pressed.connect(on_select_file)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_select_file():
	TransitionScreen.DoAnimation()
	await TransitionScreen.on_transition_finished
	SceneManager.change_scene("res://assets/scenes/Game/start_new_game_menu.tscn")
