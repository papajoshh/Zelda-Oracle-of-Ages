extends Node2D

@onready var characterBody:CharacterBody2D = get_parent()
@export var move_speed: float = 100
@export var collisionShape:CollisionShape2D

enum {IDLE, WALK, PUSH}
var state = IDLE

@onready var animation_tree: AnimationTree =  GetAnimationTree()
@onready var state_machine = animation_tree["parameters/playback"]

var blend_position: Vector2 = Vector2.ZERO
var blend_pos_paths = [
	"parameters/Idle/idle_bs2d/blend_position",
	"parameters/Walk/walk_bs2d/blend_position",
	"parameters/Push/push_bs2d/blend_position"
]
var animTree_state_keys = [
	"Idle",
	"Walk",
	"Push"
]

var isColliding:bool

	
func GetAnimationTree():
	var childrens = get_children()
	for children in childrens:
		if children is AnimationTree:
			return children
			
func _physics_process(delta):
	if characterBody == null: return
	move(delta)
	animate()

func OnCollide():
	isColliding = true
	
func OnExitCollide():
	isColliding = false
	
func move(delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if input_direction == Vector2.ZERO || !InputManager.checkInput:
		state = IDLE
	else:
		blend_position = input_direction	
	
	if(InputManager.checkInput):
		#characterBody.velocity = input_direction.normalized() * move_speed
		if input_direction == Vector2.ZERO || !InputManager.checkInput:
			state = IDLE
		else:
			var collision = characterBody.move_and_collide(input_direction.normalized() * move_speed * delta)
			if(collision != null):
				state = PUSH
			else:
				state = WALK

func autoMove(position:Vector2, moveDuration:float):
	var tween = get_tree().create_tween()
	tween.tween_property(characterBody, "position", characterBody.position + position, moveDuration)

func animate() -> void:
	state_machine.travel(animTree_state_keys[state])
	animation_tree.set(blend_pos_paths[state], blend_position)
