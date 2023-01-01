extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_over = false
var deleted = false
var texture = preload("res://sprites/Paper.png")
var dup
# Called when the node enters the scene tree for the first time.
func _delete_card():
	if(mouse_over == true && deleted == false && Input.is_action_just_pressed("mouse_left_click")):
		Table.player_choice = Table.cards.Paper
		Table.result = true
		Table.played = true
		deleted = true
		Table.actual_hand -= 1
		Table.draw_three -= 1
		dup = Sprite.new()
		add_child(dup)
		dup.set_texture(texture)
		dup.z_index = Table.layer
		Table.layer += 1
		dup.set_global_position(Vector2(896,354))
		$Paper_Card.queue_free()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_delete_card()
	pass


func _on_Area2D_mouse_entered():
	mouse_over = true
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	mouse_over = false
	pass # Replace with function body.
