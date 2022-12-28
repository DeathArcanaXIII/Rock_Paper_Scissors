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

func _check_winner():
	if(Table.deck_size == 0 && Table.enemy_deck_size == 0 && Table.actual_hand == 0):
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
