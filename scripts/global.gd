extends Node

var nivelDesbloquedo = 1
var nivelActual = 1
var menu_pausa_instancia

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func setNivelActual(nivel : int) -> void:
	nivelActual = nivel
	print(nivelActual)
	
	
func getNivelSiguienteActual() -> int:
	nivelActual += 1
	if nivelDesbloquedo < nivelActual:
		nivelDesbloquedo = nivelActual 
	return nivelActual
	
func getNivel(nivel : int) -> String:
	return ("res://escenas/nivel" + str(nivel)+".tscn")
	
func getNivelSiguienteNivelDisponible() -> int:
	return nivelDesbloquedo + 1
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausa") and (get_tree().current_scene.scene_file_path != "res://escenas/Inicio.tscn" and get_tree().current_scene.scene_file_path != "res://escenas/niveles.tscn") :

		if  not is_instance_valid(menu_pausa_instancia):
			var pausa = preload("res://escenas/menuPausa.tscn")
			menu_pausa_instancia = pausa.instantiate()
			menu_pausa_instancia.z_index = 100
			add_child(menu_pausa_instancia)
		else :
			menu_pausa_instancia.despausar()
		
	
		
