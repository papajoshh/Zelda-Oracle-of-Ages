class_name Player
extends CharacterBody2D

signal OnCollide

func _physics_process(delta):
	OnCollide.emit()
