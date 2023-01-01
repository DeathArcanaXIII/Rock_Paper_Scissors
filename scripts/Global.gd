extends Node
# Called when the node enters the scene tree for the first time.
func _debug_button():
	if(Input.is_action_just_pressed("DEBUG")):
		get_tree().reload_current_scene()
		get_tree().change_scene("res://scenes/Main Menu.tscn")
func _enemy_deck_count_fix():
	if(Table.enemy_deck_size == -3):
		Table.enemy_deck_size = 0
func _result_check():
	if(Table.result == true):
		if(Table.pick == Table.cards.Paper && Table.player_choice == Table.cards.Paper):
			print("Empate")
			Table.result = false
		elif(Table.pick == Table.cards.Rock && Table.player_choice == Table.cards.Rock):
			print("Empate")
			Table.result = false
		elif(Table.pick == Table.cards.Scissors && Table.player_choice == Table.cards.Scissors):
			print("Empate")
			Table.result = false
		elif(Table.pick == Table.cards.Paper && Table.player_choice == Table.cards.Rock):
			print("Você perdeu!")
			Table.score_enemy += 1
			Table.result = false
		elif(Table.pick == Table.cards.Rock && Table.player_choice == Table.cards.Scissors):
			print("Você perdeu!")
			Table.score_enemy += 1
			Table.result = false
		elif(Table.pick == Table.cards.Scissors && Table.player_choice == Table.cards.Paper):
			print("Você perdeu!")
			Table.score_enemy += 1
			Table.result = false
		elif(Table.pick == Table.cards.Paper && Table.player_choice == Table.cards.Scissors):
			print("Você ganhou!")
			Table.score_player += 1
			Table.result = false 
		elif(Table.pick == Table.cards.Rock && Table.player_choice == Table.cards.Paper):
			print("Você ganhou!")
			Table.score_player += 1
			Table.result = false 
		elif(Table.pick == Table.cards.Scissors && Table.player_choice == Table.cards.Rock):
			print("Você ganhou!")
			Table.score_player += 1
			Table.result = false 
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
	_result_check()
	_debug_button()
	pass

