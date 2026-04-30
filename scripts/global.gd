extends Node

var nivelDesbloquedo = 1
var nivelActual = 1



func setNivelActual(nivel : int) -> void:
	nivelActual = nivel
	
	
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
	if event.is_action_pressed("pausa") :
		if !has_node("res://escenas/menuPausa.tscn"):
			var pausa = preload("res://escenas/menuPausa.tscn")
			add_child(pausa.instantiate())
		else :
			get_tree().get_node("MenuPausa").despausar()
		
	
		
