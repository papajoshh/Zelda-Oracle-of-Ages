extends Node
signal on_transition_finished

@onready var animation_player = $CanvasLayer/AnimationPlayer
@onready var color_rect = $CanvasLayer/ColorRect

func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_in":
		on_transition_finished.emit();
		animation_player.play("fade_out")
	elif anim_name == "fade_out":
		color_rect.visible = false
		
func DoAnimation():
	color_rect.visible = true
	animation_player.play("fade_in")
