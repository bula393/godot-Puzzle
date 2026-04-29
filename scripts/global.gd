extends Node

var nivelDesbloquedo = 1
var nivelActual = 1

func setNivelActual(nivel : int) -> void:
	nivelActual = nivel
	
	
func getNivelSiguienteActual() -> int:
	nivelActual += 1
	return nivelActual
	
func getNivel(nivel : int) -> String:
	return ("res://escenas/nivel" + str(nivel)+".tscn")
	
func getNivelSiguienteNivelDisponible() -> int:
	return nivelDesbloquedo + 1
