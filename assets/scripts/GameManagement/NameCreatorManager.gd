class_name NameCreatorManager

extends Node

@export var nameTextUI:RichTextLabel
@export var writeIndicator: Control
@export var initialLetterPosition: Control
@export var spaceBetweenLetters:float

var storedName:Array[String] = ["  ", "  ", "  ", "  ", "  "]
var currentIndex:int = 0

func DeleteLetter():
	storedName[currentIndex] = "  "
	if(currentIndex > 0):
		currentIndex = currentIndex - 1
	FormatText()
	
func StoreLetterName(letterToAdd:String):
	if(currentIndex >= storedName.size()): return
	storedName[currentIndex] = letterToAdd
	if(currentIndex < storedName.size() - 1):
		currentIndex = currentIndex + 1
	FormatText()
	
func GetName():
	var textToShow:String= ""
	for letter in storedName:
		textToShow = textToShow + letter
	return textToShow

func GetEmptyName():
	return "          "
func FormatText():
	var textToShow:String= GetName()
	nameTextUI.text = textToShow
	writeIndicator.set_position(initialLetterPosition.position + Vector2(spaceBetweenLetters * currentIndex, 0))

func NextLetter():
	if(currentIndex < storedName.size() - 1):
		currentIndex = currentIndex + 1
	writeIndicator.set_position(initialLetterPosition.position + Vector2(spaceBetweenLetters * currentIndex, 0))

func PrevLetter():
	if(currentIndex > 0):
		currentIndex = currentIndex - 1
	writeIndicator.set_position(initialLetterPosition.position + Vector2(spaceBetweenLetters * currentIndex, 0))
