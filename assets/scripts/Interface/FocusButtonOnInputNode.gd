
class_name FocusButtonOnInputNode
extends Node

@export var button:Button
@export var signalToConnect:String

func _ready():
	InputManager.connect(signalToConnect, focusButton)
	
func focusButton():
	button.grab_focus()
