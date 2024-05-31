extends Node
signal on_transition_finished

@onready var animation_player = $CanvasLayer/AnimationPlayer
@onready var color_rect = $CanvasLayer/ColorRect as ColorRect

var durationTween: float
var tween: Tween

func _ready():
	animation_player.animation_finished.connect(_on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "fade_in":
		on_transition_finished.emit();
		animation_player.play("fade_out")
		
func DoAnimation():
	animation_player.play("fade_in")
	
func FadeInOut(duration, color, callable = null):
	durationTween = duration
	
	if tween:
		tween.stop()
		tween.kill()
	
	tween = get_tree().create_tween()
	tween.tween_property(color_rect, "color", color, durationTween)
	if callable: 
		tween.tween_callback(callable)
	tween.tween_property(color_rect, "color", Color(color, 0), durationTween)
	tween.play()
	await tween.finished

func DoAnimationFor(duration, color, callable = null):
	durationTween = duration
	
	if tween:
		tween.stop()
		tween.kill()
	
	tween = get_tree().create_tween()
	tween.tween_property(color_rect, "color", color, durationTween)
	if callable: 
		tween.tween_callback(callable)
	tween.play()
	await tween.finished
	
