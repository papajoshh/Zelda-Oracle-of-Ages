extends Node

var GameEvents = {}


func GetGameEvent(eventName):
	if(!GameEvents.has(eventName)):
		GameEvents.eventName = GameEvent.new()
	return GameEvent[eventName]

class GameEvent:
	signal OnFail
	signal OnAchieve
	var Achieved = false
	
	func Achieve():
		OnAchieve.emit()
	
	func Fail():
		OnFail.emit()
