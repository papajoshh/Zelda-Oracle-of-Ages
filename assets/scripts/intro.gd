extends Control

@export var initialVideo: VideoStream;
@export var startInputSound: AudioStream
@export var videoToChange: VideoStream;
@export var timeToSkip: float = 78;
@onready var video_stream_player = $VideoStreamPlayer

@onready var play_color_animation_node = $PlayColorAnimationNode

var outOfIntro : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	InputManager.start_pressed.connect(_on_skip_video)

func _on_skip_video():
	if !video_stream_player.is_playing():
		video_stream_player.play()
	elif video_stream_player.get_stream_position() < 78 and video_stream_player.stream == initialVideo:
		video_stream_player.stream = videoToChange;
		video_stream_player.play()
	elif video_stream_player.get_stream_position() >= 78 or video_stream_player.stream == videoToChange:
		if 	!outOfIntro:
			outOfIntro = true;
			SoundManager.play_ui_sound(startInputSound)
			var tween = get_tree().create_tween()
			tween.tween_property(video_stream_player, "volume", 0, 1)
			play_color_animation_node.DoAnimation()
			await play_color_animation_node.on_transition_finished
			SceneManager.change_scene("res://assets/scenes/Game/main_menu.tscn")
			visible = false;
		else:
			pass

func _on_video_stream_player_finished():
	video_stream_player.stream = initialVideo;
	video_stream_player.play()
