class_name RightLetterOnSelectButtonNode

extends Control

@export var button: Button
@export var nameManager: NameCreatorManager

func _ready():
	button.pressed.connect(NextLetter)
	
func NextLetter():
	nameManager.NextLetter()
