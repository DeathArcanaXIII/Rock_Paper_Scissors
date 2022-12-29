extends Sprite

enum cards_2 {Paper = 0, Scissors = 2}

var mouse_over = false
var deck = [7,7,7,7,7,7,7,7,7,7,7,7,7,7,7] 
var playerHand = [7,7,7]
var mouseOver = false
var deck_position = 0
var scene_paper = preload("res://scenes/Paper.tscn")
var scene_rock = preload("res://scenes/Rock.tscn")
var scene_scissors = preload("res://scenes/Scissors.tscn")

func _fillDeck(): #Preenche a Array e embaralha os elementos da mesma
	for n in range (0,5,+1):
		deck[n] = Table.cards.Paper
	for n in range (5,10,+1):
		deck[n] = Table.cards.Rock
	for n in range(10,15,+1):
		deck[n] = Table.cards.Scissors
	randomize()
	deck.shuffle()

func _instance_card(scene_instance):
	var scene = scene_instance
	var card = scene.instance()
	add_child(card)
	card.set_global_position(Vector2(Table.xAxys,Table.yAxys))#Posiciona a cena
	Table.xAxys += 192
	Table.deck_size -= 1 #"Tira" uma carta do deck
	Table.actual_hand += 1#"Aumenta" uma carta na mão
	Table.draw_three += 1#confirma se 3 cartas foram compradas
	Table.paper_total -= 1

func _instance_player_hand(): #Ao clicar checa a validez da jogada e gera 3 cartas na mão do jogador baseado na posição do "apontador" da array
	if (mouse_over == true && Table.deck_size > 0 && Table.actual_hand < 3 && Input.is_action_just_pressed("mouse_left_click")):
		for n in range (0,3,+1): #Colocar as cartas do topo na mão do jogador e salva a ultima posição
			playerHand[n] = deck[deck_position]
			deck_position += 1
		for n in range (0,3,+1): #Instanceia as cartas da mão do jogador
			if (playerHand[n] == Table.cards.Paper):
				_instance_card(scene_paper)
			elif(playerHand[n] == Table.cards.Rock):
				_instance_card(scene_rock)
			elif (playerHand[n] == Table.cards.Scissors):
				_instance_card(scene_scissors)

func _drawed_3():#Ajusta as posições das cartas
	if(Table.draw_three == 3):
		Table.xAxys = 512
		Table.yAxys = 580

func _ready():
	_fillDeck()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_instance_player_hand()
	_drawed_3()
	pass

func _on_Area2D_mouse_entered():
	mouse_over = true
	pass # Replace with function body.

func _on_Area2D_mouse_exited():
	mouse_over = false
	pass # Replace with function body.
