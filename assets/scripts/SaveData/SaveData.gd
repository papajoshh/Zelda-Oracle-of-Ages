extends Node

func _ready():
	SaveSystem.loaded.connect(Load)

func Load():
	var first_load = not SaveSystem.has("fileData_1")
	
	if first_load:
		SaveSystem.delete_all()
		
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
