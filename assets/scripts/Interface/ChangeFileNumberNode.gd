extends Control
@export var fileIconTexture: TextureRect
@export var textures: Array[Texture]

func _ready():
	var numberFile:int = FileManager.currentSlotId
	fileIconTexture.texture = textures[numberFile]

