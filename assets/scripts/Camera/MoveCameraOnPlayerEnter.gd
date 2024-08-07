extends Area2D

@export var tweenDuration:float
@export var distanceToMove:Vector2
@export var distancePlayerToMove:Vector2
@export var area2D:Area2D

func _on_body_entered(body):
	var posNode:Node = get_node("TargetPosition")
	if(posNode == null): return
	var walkController = body.get_node("WalkController")
	if(walkController != null):
		walkController.autoMove(distancePlayerToMove, tweenDuration)
	await %Camera2D.move(posNode.global_position, tweenDuration)
	monitoring = false
	area2D.monitoring = true
