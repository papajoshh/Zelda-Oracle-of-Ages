extends Control

@export var button: Button
@export var slotId: int
@export var eraseButton: Button
@export var quitButton:Button
@export var deleteIcon:TextureRect


func _ready():
	button.pressed.connect(on_select_file)
	button.focus_entered.connect(on_focus_file)

func on_focus_file():
	FileManager.ChangeSlot(slotId)
	
func on_select_file():
	deleteIcon.visible = true
	quitButton.grab_focus()
	quitButton.focus_neighbor_right = eraseButton.get_path()
	quitButton.focus_neighbor_top = ""
