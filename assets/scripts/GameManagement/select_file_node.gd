extends Control

@export var button: Button
@export var slotId: int

var slotData

func _ready():
	button.pressed.connect(on_select_file)
	button.focus_entered.connect(on_focus_file)
	slotData = SaveData.GetSlot(slotId)

func on_focus_file():
	FileManager.ChangeSlot(slotId)
	
func on_select_file():
	if(slotData.gameCreated):
		pass
	else:
		await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind("res://assets/scenes/Game/start_new_game_menu.tscn"))
