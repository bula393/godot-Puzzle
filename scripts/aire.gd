extends Area2D
var velocidad = 500
var direccion 
var Modo

func setDireccion(dir : String) -> void:
	direccion = dir
	if dir == "left":
		$Sprite2D.flip_h = true
	else :
		$Sprite2D.flip_h = false

func getDireccion() -> String:
	return direccion

func setModo(modo : String) -> void:
	Modo = modo
	
func verModo() -> int:
	if Modo == "atraer":
		return -1
	else:
		return 1 

func getDireccionOrientacion() -> int:
	if direccion == "left":
		return -1
	elif direccion == "right":
		return 1 
	return 0	
	
func _on_body_entered(body: Node2D) -> void:
		if body is CharacterBody2D and body.get_collision_layer_value(3):
			body.velocity.x = getDireccionOrientacion() * velocidad * verModo()
		elif body is StaticBody2D and body.get_collision_layer_value(5):
			body.setCerrar()


func _on_area_entered(area: Area2D) -> void:
		if area.get_collision_layer_value(8):
			area.activarbomb()
