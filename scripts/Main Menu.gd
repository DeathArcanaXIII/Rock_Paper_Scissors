extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Novo_Jogo_pressed():
	get_tree().change_scene("res://scenes/Table.tscn")
	pass # Replace with function body.


func _on_Ajuda_pressed():
	get_tree().change_scene("res://scenes/Ajuda.tscn")
	pass # Replace with function body.


func _on_Sair_pressed():
	get_tree().quit()
	pass # Replace with function body.
