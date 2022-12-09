extends Node

# Called when the node enters the scene tree for the first time.
func _randomize_enemy_cards():
	randomize()
	Table.enemy_cards = randi() % Table.cards.size()
func _enemy_deck_count_fix():
	if(Table.enemy_deck_size == -1):
		Table.enemy_deck_size = 0
func _players_choices():
	if (Table.player_choice == Table.cards.Paper && Table.enemy_cards == Table.cards.Paper):
		Table.player_choice = 12
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.empate)
	elif (Table.player_choice == Table.cards.Paper && Table.enemy_cards == Table.cards.Rock):
		Table.player_choice = 12
		Table.score_player += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p1)
	elif (Table.player_choice == Table.cards.Paper && Table.enemy_cards == Table.cards.Scissors):
		Table.player_choice = 12
		Table.score_enemy += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p2)
	elif (Table.player_choice == Table.cards.Rock && Table.enemy_cards == Table.cards.Paper):
		Table.player_choice = 12
		Table.score_enemy += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p2)
	elif (Table.player_choice == Table.cards.Rock && Table.enemy_cards == Table.cards.Rock):
		Table.player_choice = 12
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.empate)
	elif (Table.player_choice == Table.cards.Rock && Table.enemy_cards == Table.cards.Scissors):
		Table.player_choice = 12
		Table.score_player += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p1)
	elif (Table.player_choice == Table.cards.Scissors && Table.enemy_cards == Table.cards.Paper):
		Table.player_choice = 12
		Table.score_player += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p1)
	elif(Table.player_choice == Table.cards.Scissors && Table.enemy_cards == Table.cards.Rock):
		Table.player_choice = 12
		Table.score_enemy += 1
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.win_p2)
	elif (Table.player_choice == Table.cards.Scissors && Table.enemy_cards == Table.cards.Scissors):
		Table.player_choice = 12
		Table.enemy_deck_size -= 1
		_randomize_enemy_cards()
		print(Table.empate)
		
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
	_players_choices()
	_instance_result()
	pass

