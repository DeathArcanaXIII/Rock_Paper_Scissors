extends Sprite

enum cards_2 {Paper = 0, Scissors = 2}

var xAxys = 512
var yAxys = 128

func _fillDeck(): #Preenche a Array e embaralha os elementos da mesma
	for n in range (0,5,+1):
		Table.deck[n] = Table.cards.Paper
	for n in range (5,10,+1):
		Table.deck[n] = Table.cards.Rock
	for n in range(10,15,+1):
		Table.deck[n] = Table.cards.Scissors
	randomize()
	Table.deck.shuffle()
	
func _instance_enemy_hand():
	if(Table.enemy_actual_hand == 0):
		for n in range (0,3,+1): #Colocar as cartas do topo na mão do jogador e salva a ultima posição
				Table.enemyHand[n] = Table.deck[Table.deck_position]
				Table.deck_position += 1
		randomize()
		for n in range (0,3,+1): #Instanceia as cartas da mão do jogador
				if (Table.enemyHand[n] == Table.cards.Paper):
					var scene = preload("res://scenes/Enemy_Paper.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
					xAxys += 192
					Table.enemy_deck_size -= 1 #"Tira" uma carta do deck
					Table.enemy_actual_hand += 1#"Aumenta" uma carta na mão
				elif (Table.enemyHand[n] == Table.cards.Rock):
					var scene = preload("res://scenes/Enemy_Rock.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
					xAxys += 192
					Table.enemy_deck_size -= 1 #"Tira" uma carta do deck
					Table.enemy_actual_hand += 1#"Aumenta" uma carta na mão
				elif (Table.enemyHand[n] == Table.cards.Scissors):
					var scene = preload("res://scenes/Enemy_Scissors.tscn")
					var card = scene.instance()
					add_child(card)
					card.set_global_position(Vector2(xAxys,yAxys))#Posiciona a cena
					xAxys += 192
					Table.enemy_deck_size -= 1 #"Tira" uma carta do deck
					Table.enemy_actual_hand += 1#"Aumenta" uma carta na mão

# Called when the node enters the scene tree for the first time.
func _ready():
	_fillDeck()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_instance_enemy_hand()
	pass
