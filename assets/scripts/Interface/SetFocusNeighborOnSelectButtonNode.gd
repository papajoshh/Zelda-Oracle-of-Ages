class_name SetFocusNeighborOnSelectButtonNode

extends Control

@export var button: Button
@export var buttonToSetFocus: Button
@export var side: Side

var focusedFirstTime = false

func _ready():
	button.pressed.connect(change_scene)
	
func change_scene():
	if(buttonToSetFocus != null):
		button.set_focus_neighbor(side, buttonToSetFocus.get_path())
	else:
		button.set_focus_neighbor(side, "")
