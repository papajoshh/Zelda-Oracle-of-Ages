extends Control

@export var button: Button
@export var slotId: int

var slotData

func _ready():
	button.pressed.connect(on_select_file)
	button.focus_entered.connect(on_focus_file)
	slotData = SaveData.GetSlot(slotId)

func on_focus_file():
	FileManager.ChangeSlot(slotId)
	
func on_select_file():
	await LoadManager.LoadGame(slotData)
