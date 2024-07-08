extends Control
func _ready():
	$VBoxContainer/Comenzar.grab_focus()
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_test.tscn")

func _on_button_2_pressed():
	get_tree().quit()
