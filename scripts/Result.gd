extends Node


# Declare member variables here. Examples:
var empate = "Empate!"
var win_p1 = "Jogador 1 venceu!"
var win_p2 = "Jogador 2 venceu!"
var draw = "Houve um empate!"
var p1 = "Parabéns voce venceu!"
var p2 = "Voce perdeu :()"
# var b = "text"
func _GUI_Result():
	if(Table.result == true):
		if (Table.player_choice == Table.cards.Paper && Table.pick == Table.cards.Paper):
			self.text = str(empate)
		elif (Table.player_choice == Table.cards.Paper && Table.pick == Table.cards.Rock):
			self.text = str(win_p1)
		elif (Table.player_choice == Table.cards.Paper && Table.pick == Table.cards.Scissors):
			self.text = str(win_p2)
		elif (Table.player_choice == Table.cards.Rock && Table.pick == Table.cards.Paper):
			self.text = str(win_p2)
		elif (Table.player_choice == Table.cards.Rock && Table.pick == Table.cards.Rock):
			self.text = str(empate)
		elif (Table.player_choice == Table.cards.Rock && Table.pick == Table.cards.Scissors):
			self.text = str(win_p1)
		elif (Table.player_choice == Table.cards.Scissors && Table.pick == Table.cards.Paper):
			self.text = str(win_p1)
		elif (Table.player_choice == Table.cards.Scissors && Table.pick == Table.cards.Rock):
			self.text = str(win_p2)
		elif (Table.player_choice == Table.cards.Scissors && Table.pick == Table.cards.Scissors):
			self.text = str(empate)
		elif (Table.player_choice == Table.cards.Joker && Table.pick == Table.cards.Scissors || Table.pick == Table.cards.Paper || Table.pick == Table.cards.Rock):
			self.text = str (win_p1)
		elif (Table.player_choice == Table.cards.Paper || Table.player_choice == Table.cards.Scissors || Table.player_choice == Table.cards.Rock && Table.pick == Table.cards.Joker):
			self.text = str (win_p2)
		elif (Table.player_choice == Table.cards.Joker && Table.pick == Table.cards.Joker):
			self.text = str (empate)

func _check_winner():
	if(Table.deck_size == 0 && Table.enemy_deck_size == 0 && Table.actual_hand == 0):
		get_node("Button").visible = true
		if(Table.score_player > Table.score_enemy):
			self.text = str(p1)
		elif(Table.score_player == Table.score_enemy):
			self.text = str(draw)
		elif(Table.score_player < Table.score_enemy):
			self.text = str(p2)
			

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_GUI_Result()
	_check_winner()
	
	
	pass


func _on_Button_pressed():
	Table.paper_total = 5
	Table.rock_total = 5
	Table.scissors_total = 5

	Table.enemy_paper_total = 5
	Table.enemy_rock_total = 5
	Table.enemy_scissors_total = 5

	Table.enemy_choice = [7,7,7]

	Table.deck = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7] 
	Table.enemyHand = [7,7,7]
	Table.deck_position = -0
	Table.pick 
	Table.result = false

	Table.layer = 0

	Table.played = false
	Table.player_deck
	Table.enemy_deck
	Table.mouse_over = false
	Table.deck_size = 15
	Table.enemy_deck_size = 15
	Table.max_hand_size = 3
	Table.actual_hand = 0
	Table.xAxys = 512
	Table.yAxys = 580
	Table.draw_three = 0
	Table.enemy_actual_hand = 0
	Table.enemy_hand_size = 3
	Table.player_choice
	Table.enemy_cards

	Table.score_player = 0
	Table.score_enemy = 0

	Table.delete_paper = 13
	Table.delete_rock = 14
	Table.delete_scissors = 15
	get_tree().reload_current_scene()
	pass # Replace with function body.
