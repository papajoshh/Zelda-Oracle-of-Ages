extends Node

var currentSlotId: int = 1
var currentGameData
signal OnChangeSlot

func ChangeSlot(_id):
	currentSlotId = _id
	currentGameData = SaveData.GetSlot(currentSlotId)
	OnChangeSlot.emit(currentGameData)
	
func SaveName(name:String):
	currentGameData.playerName = name
	currentGameData.gameCreated = true
	SaveData.SaveSlot(currentGameData, currentSlotId)
	
func DeleteCurrentSlot():
	currentGameData = GameData.new()
	SaveData.SaveSlot(currentGameData, currentSlotId)
