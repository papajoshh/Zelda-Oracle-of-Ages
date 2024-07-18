extends Node2D

@onready var characterBody:CharacterBody2D = get_parent()
@export var move_speed: float = 100
@export var collisionShape:CollisionShape2D

enum {IDLE, WALK, PUSH}
var state = IDLE
var input_direction:Vector2 = Vector2.ZERO

@onready var animation_tree: AnimationTree =  GetAnimationTree()
@onready var state_machine = animation_tree["parameters/playback"]

var blend_position: Vector2 = Vector2(0,1)
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
	input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if input_direction == Vector2.ZERO || !InputManager.checkInput:
		state = IDLE
	else:
		var collision = characterBody.move_and_collide(input_direction.normalized() * move_speed * delta)
		if(collision != null):
			if(state != PUSH):
				var normal = -collision.get_normal()
				blend_position = Vector2(snappedi(normal.x, 1), snappedi(normal.y, 1))
			state = PUSH
		else:
			state = WALK
			blend_position = Vector2(snappedi(input_direction.x, 1), snappedi(input_direction.y, 1))
		
	

func autoMove(position:Vector2, moveDuration:float):
	var tween = get_tree().create_tween()
	tween.tween_property(characterBody, "position", characterBody.position + position, moveDuration)

func animate() -> void:
	state_machine.travel(animTree_state_keys[state])
	animation_tree.set(blend_pos_paths[state], blend_position)
