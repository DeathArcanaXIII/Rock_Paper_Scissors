extends Sprite

enum cards_2 {Paper = 0, Scissors = 2}

var choice
var all_cards_played = false
var card_paper
var card_rock
var card_scissors
var xAxys = 384
var yAxys = 0
var enemy_paper = preload("res://scenes/Enemy_Paper.tscn")
var enemy_rock = preload("res://scenes/Enemy_Rock.tscn")
var enemy_scissors = preload("res://scenes/Enemy_Scissors.tscn")
var paper_scene = preload("res://scenes/Paper_Display.tscn")
var rock_scene = preload("res://scenes/Rock_Display.tscn")
var scissors_scene = preload("res://scenes/Scissors_Display.tscn")

func _fillDeck(): #Preenche a Array e embaralha os elementos da mesma
	for n in range (0,5,+1):
		Table.deck[n] = Table.cards.Paper
	for n in range (5,10,+1):
		Table.deck[n] = Table.cards.Rock
	for n in range(10,15,+1):
		Table.deck[n] = Table.cards.Scissors
	randomize()
	Table.deck.shuffle()

func _show_enemy_pick(packed_scene):
			var scene = packed_scene
			var paper = scene.instance()
			add_child(paper)
			paper.set_position(Vector2(384,225))

func _enemy_pick():
	if(Table.played == true):
		randomize()
		var temp = randi() % Table.enemyHand.size()
		Table.pick = Table.enemyHand[temp]
		Table.enemyHand.pop_at(temp)
		Table.enemy_actual_hand -= 1
		Table.played = false
		if(Table.pick == Table.cards.Paper):
			_show_enemy_pick(paper_scene)
		if(Table.pick == Table.cards.Rock):
			_show_enemy_pick(rock_scene)
		if(Table.pick == Table.cards.Scissors):
			_show_enemy_pick(scissors_scene)
			
		if(Table.enemy_actual_hand == 0):
			all_cards_played = true
			Table.enemyHand = [7,7,7]
		if(Table.enemy_actual_hand > 0):
			all_cards_played = false

func _re_instance_enemy_hand():
	if(Table.actual_hand == 0 && all_cards_played == true):
		_instance_enemy_hand()
		
func _drawed_3():
	if(Table.draw_three == 3):
		xAxys = 384
		yAxys = 0

func _instance_card(scene_instance):
	var scene = scene_instance
	card_paper = scene.instance()
	add_child(card_paper)
	card_paper.set_position(Vector2(xAxys,yAxys))#Posiciona a cena
	xAxys += 192
	Table.enemy_deck_size -= 1 #"Tira" uma carta do deck
	Table.enemy_actual_hand += 1#"Aumenta" uma carta na mão

func _instance_enemy_hand():
	if(Table.enemy_actual_hand == 0):
		for n in range (0,3,+1): #Colocar as cartas do topo na mão do jogador e salva a ultima posição
				Table.enemyHand[n] = Table.deck[Table.deck_position]
				Table.deck_position += 1
				if(Table.deck_position == 15):
					Table.deck_position = 0
		randomize()
		for n in range (0,3,+1): #Instanceia as cartas da mão do jogador
				if (Table.enemyHand[n] == Table.cards.Paper):
					_instance_card(enemy_paper)
				elif (Table.enemyHand[n] == Table.cards.Rock):
					_instance_card(enemy_rock)
				elif (Table.enemyHand[n] == Table.cards.Scissors):
					_instance_card(enemy_scissors)
# Called when the node enters the scene tree for the first time.
func _ready():
	_fillDeck()
	_instance_enemy_hand()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_re_instance_enemy_hand()
	_enemy_pick()
	_drawed_3()
	pass
