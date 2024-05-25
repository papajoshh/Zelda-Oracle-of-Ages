extends Node2D

signal ui_up_pressed
signal ui_down_pressed
signal ui_left_pressed
signal ui_right_pressed
signal start_pressed
signal start_realeased

func _process(delta):
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
