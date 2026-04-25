
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and (body.get_collision_layer_value(1) or body.get_collision_layer_value(3)):
		body.velocity.y = -400
		body.apagarGravedad()


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: 
		body.encenderGravedad()
