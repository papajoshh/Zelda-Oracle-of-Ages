extends Node

@export var textLabel:RichTextLabel
@export var slotId:int

func _ready():
	textLabel.text = SaveData.GetSlot(slotId).playerName
