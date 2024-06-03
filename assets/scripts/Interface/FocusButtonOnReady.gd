class_name FocusButtonOnReady

extends Control

@export var defaultButton:Button

func _ready():
	defaultButton.grab_focus()
