extends Node

func _ready():
	await get_tree().create_timer(0.2).timeout
	var first_load = not SaveSystem.has("fileData_1")
	
	if first_load:
		for fileId in 3:
			var res := GameData.new()
			res.id = fileId
			SaveSystem.set_var("fileData_" + str(fileId), res)
			
func GetSlot(id):
	var res = SaveSystem.get_var("fileData_" + str(id), GameData.new())
	return res

func SaveSlot(gameData, slotId):
	SaveSystem.set_var("fileData_" + str(slotId), gameData)
