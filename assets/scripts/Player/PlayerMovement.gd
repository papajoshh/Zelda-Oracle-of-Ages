extends Node2D

@onready var characterBody:CharacterBody2D = get_parent()
@export var move_speed: float = 100

enum {IDLE, WALK}
var state = IDLE

@onready var animation_tree: AnimationTree =  GetAnimationTree()
@onready var state_machine = animation_tree["parameters/playback"]

var blend_position: Vector2 = Vector2.ZERO
var blend_pos_paths = [
	"parameters/Idle/idle_bs2d/blend_position",
	"parameters/Walk/walk_bs2d/blend_position"
]
var animTree_state_keys = [
	"Idle",
	"Walk"
]

func GetAnimationTree():
	var childrens = get_children()
	for children in childrens:
		if children is AnimationTree:
			return children
			
func _physics_process(delta):
	if characterBody == null: return
	move(delta)
	animate()

func move(delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if input_direction == Vector2.ZERO:
		state = IDLE
	else:
		state = WALK
		blend_position = input_direction
	
	characterBody.velocity = input_direction.normalized() * move_speed
	characterBody.move_and_slide()
	
func animate() -> void:
	state_machine.travel(animTree_state_keys[state])
	animation_tree.set(blend_pos_paths[state], blend_position)
