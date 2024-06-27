extends Area2D

@export var tweenDuration:float
@export var distanceToMove:Vector2

func _on_body_entered(body):
	var posNode:Node = get_node("TargetPosition")
	if(posNode == null): return
	%Camera2D.move(posNode.global_position, tweenDuration);
	monitoring = false
