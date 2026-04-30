extends Control

var nivel

func setNivel(n : int)  -> void:
	nivel = n
	$Button.text = str(n)
	

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(Global.getNivel(nivel)) 
