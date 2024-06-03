class_name LeftLetterOnSelectButtonNode

extends Control

@export var button: Button
@export var nameManager: NameCreatorManager

func _ready():
	button.pressed.connect(PrevLetter)
	
func PrevLetter():
	nameManager.PrevLetter()
