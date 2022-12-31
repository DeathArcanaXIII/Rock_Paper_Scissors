extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _score():
	self.text = str("Score: ",Table.score_enemy)
# Called when the node enters the scene tree for the first time.
func _ready():
	_score()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_score()
	pass
