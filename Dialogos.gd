extends Node
var nom_obj
var dialogo = []

# Called when the node enters the scene tree for the first time.
func _dialogos():
	match nom_obj:
		"Buzon":
			dialogo = ["No me llega el correo aun"]
