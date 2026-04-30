extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("se pauso")
	get_tree().paused = true

func despausar() -> void:
	get_tree().paused = false
	queue_free()
	



func _on_button_pressed() -> void:
	despausar()
	
	



func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/Inicio.tscn")
	queue_free()
