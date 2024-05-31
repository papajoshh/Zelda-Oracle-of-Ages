extends Node

var currentSlotId: int = 1
var currentGameData
signal OnChangeSlot

func ChangeSlot(_id):
	currentSlotId = _id
	currentGameData = SaveData.GetSlot(currentSlotId)
	OnChangeSlot.emit(currentGameData)
