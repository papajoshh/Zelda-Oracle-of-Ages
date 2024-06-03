class_name AssignLetterOnSelectButton

extends Control

@export var letter:String
@export var button: Button
@export var nameManager: NameCreatorManager

func _ready():
	button.pressed.connect(StoreLetter)
	
func StoreLetter():
	nameManager.StoreLetterName(letter)
