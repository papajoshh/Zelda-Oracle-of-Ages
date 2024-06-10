extends Node

@export var gameNotCreatedContainer: Control
@export var gameCreatedContainer: Control
@export var hearts:Array[Node]
@export var rupiasCounter:RichTextLabel

func _ready():
	FileManager.OnChangeSlot.connect(_on_slot_changed)
	
func _on_slot_changed(gameData):
	gameCreatedContainer.visible = gameData.gameCreated
	gameNotCreatedContainer.visible = !gameData.gameCreated
	if(gameData.gameCreated):
		rupiasCounter.text = "[b]" + "%03d" % gameData.rupias + "[/b]"
	for i in hearts.size():
		hearts[i].visible = i < gameData.numberOfHearts

