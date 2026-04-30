extends Control

const BOTON_NIVEL = preload("res://escenas/botonNivel.tscn")

func _ready():
	for n in range(1, Global.nivelDesbloquedo + 1):
		var boton = BOTON_NIVEL.instantiate()
		$GridContainer.add_child(boton)
		boton.setNivel(n)
