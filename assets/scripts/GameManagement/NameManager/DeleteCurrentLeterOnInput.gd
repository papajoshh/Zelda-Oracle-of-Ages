extends Node

@export var signalToConnect:String = ""
@export var nameManager:NameCreatorManager

func _ready():
	InputManager.connect(signalToConnect, DeleteLetter)

func DeleteLetter():
	nameManager.DeleteLetter()
