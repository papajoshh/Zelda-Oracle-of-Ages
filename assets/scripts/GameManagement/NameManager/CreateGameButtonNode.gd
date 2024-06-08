extends Control

@export var button: Button
@export var nameManager: NameCreatorManager

func _ready():
	button.pressed.connect(CreateFileName)
	
func CreateFileName():
	var nameToCreate:String = nameManager.GetName()
	if(nameToCreate != nameManager.GetEmptyName()):
		FileManager.SaveName(nameToCreate)
	await TransitionScreen.FadeInOut(0.1, Color.WHITE, SceneManager.change_scene.bind("res://assets/scenes/Game/main_menu.tscn"))
