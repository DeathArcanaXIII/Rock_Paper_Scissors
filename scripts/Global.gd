extends Node

# Called when the node enters the scene tree for the first time.
func _enemy_deck_count_fix():
	if(Table.enemy_deck_size == -1):
		Table.enemy_deck_size = 0

		
func _instance_result():
	var result = Table.result_00.instance()
	add_child(result)
	
func _instance_player_deck():
	Table.player_deck = Table.deck_00.instance()
	add_child(Table.player_deck)
	Table.player_deck.set_position(Vector2(128, 580))
	
func _instance_enemy_deck():
	Table.enemy_deck = Table.deck_01.instance()
	add_child(Table.enemy_deck)
	Table.enemy_deck.set_position(Vector2(128, 128))
	
func _ready():
	_instance_player_deck()
	_instance_enemy_deck()
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_enemy_deck_count_fix()
	_instance_result()
	pass

