class_name SetVisibleOnFocusNode

extends Control

@export var node:Control
@export var statusToSet:bool
@export var button: Button
@export var ignoreFirstFocus: bool

var focusedFirstTime = false

func _ready():
	button.focus_entered.connect(SetState.bind(statusToSet))
	button.focus_exited.connect(SetState.bind(!statusToSet))
	
func SetState(_statusToSet:bool):
	if(ignoreFirstFocus and !focusedFirstTime):
		focusedFirstTime = true
		return
	node.visible = _statusToSet
