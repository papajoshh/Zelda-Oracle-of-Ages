extends Control

@export var button: Button

func _ready():
	button.pressed.connect(DeleteFile)
	
func DeleteFile():
	if(FileManager.currentSlotId > 0):
		FileManager.DeleteCurrentSlot()
	await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind("res://assets/scenes/Game/main_menu.tscn"))
