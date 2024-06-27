extends Node2D

signal a_button_pressed
signal a_button_realeased
signal b_button_pressed
signal b_button_realeased
signal ui_up_pressed
signal ui_down_pressed
signal ui_left_pressed
signal ui_right_pressed
signal start_pressed
signal start_realeased

var checkInput:bool = true
func _process(delta):
	if(!checkInput): return
	if Input.is_action_just_pressed("ui_down"):
		ui_down_pressed.emit()
	if Input.is_action_just_pressed("ui_up"):
		ui_up_pressed.emit()
	if Input.is_action_just_pressed("ui_left"):
		ui_left_pressed.emit()
	if Input.is_action_just_pressed("ui_right"):
		ui_right_pressed.emit()
	if Input.is_action_just_pressed("Start"):
		start_pressed.emit()
	if Input.is_action_just_released("Start"):
		start_realeased.emit()
	if Input.is_action_just_pressed("B"):
		b_button_pressed.emit()
	if Input.is_action_just_released("B"):
		b_button_realeased.emit()
	if Input.is_action_just_pressed("A"):
		a_button_pressed.emit()
	if Input.is_action_just_released("A"):
		a_button_realeased.emit()
